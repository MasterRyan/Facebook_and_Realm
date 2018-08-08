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
import RealmSwift

class Page : Object {

    @objc dynamic var name: String = ""

}

class FacebookManager: NSObject {

    public static func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        // Override point for customization after application launch.
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    public static func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
    }

    static public func loginButton() -> FBSDKLoginButton {

        let loginButton = FBSDKLoginButton()
        loginButton.publishPermissions = ["manage_pages"] //move to config plist
        return loginButton
    }

    static public func isLoggedin() -> Bool {
        updateListOfPages { (result, _) in
            print(result ?? "nil")
        }
        return FBSDKAccessToken.currentAccessTokenIsActive()
    }

    static public func updateListOfPages(_ responseHandler: @escaping (Results<Page>?, Error?)->())  {

        let realm = try? Realm()
        var storedResults: Results<Page>?

        storedResults = realm?.objects(Page.self)
        responseHandler(storedResults, nil)

        FBSDKGraphRequest(graphPath: "me/accounts", parameters: [:]).start() { _, result, error in

            guard let data = result as? Dictionary<String, Any> else { responseHandler(nil,nil); return }
            guard let dataArray = data["data"] as? [Dictionary<String, Any>] else { responseHandler(nil,nil); return }
            try? realm?.write {
                for item in dataArray {
                    let page = Page()
                    page.name = item["name"] as! String
                    if storedResults?.contains(where: { (item) -> Bool in
                        return item.name == page.name
                    }) == false {
                        realm?.add(page)
                    }
                }
            }
            responseHandler(storedResults, nil)

        }
    }
}


