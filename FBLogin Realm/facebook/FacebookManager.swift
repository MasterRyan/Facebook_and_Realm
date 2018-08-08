//
//  FacebookManager.swift
//  FBLogin Realm
//
//  Created by user141656 on 8/8/18.
//  Copyright © 2018 Ryan. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import FBSDKCoreKit

struct Page {
    let name: String!
}

class FacebookManager: NSObject {

    static public func loginButton() -> FBSDKLoginButton {

        let loginButton = FBSDKLoginButton()
        loginButton.publishPermissions = ["manage_pages"] //move to config plist
        return loginButton
    }

    static public func isLoggedin() -> Bool {
        return FBSDKAccessToken.currentAccessTokenIsActive()
    }

    static public func updateListOfPages(_ responseHandler: @escaping ([Page]?, Error?)->())  {
        FBSDKGraphRequest(graphPath: "me/accounts", parameters: [:]).start() { _, result, error in

            guard let data = result as? Dictionary<String, Any> else { responseHandler(nil,nil); return }
            guard let dataArray = data["data"] as? [Dictionary<String, Any>] else { responseHandler(nil,nil); return }

            let returnArray = dataArray.filter { (item) in
                return (item["name"] as? String != nil) // ensure it has a name
            }.map { (item) in
                Page(name: item["name"] as! String)
            }
            responseHandler(returnArray, nil)
        }
    }
}


