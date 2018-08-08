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


class FacebookManager: NSObject {

    static public func loginButton() -> FBSDKLoginButton {

        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["manage_pages"] //move to config plist
        return loginButton
    }

    static public func isLoggedin() -> Bool {
        if FBSDKAccessToken.currentAccessTokenIsActive() {
            return true
        }
        return false
    }

}
