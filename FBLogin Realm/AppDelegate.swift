//
//  AppDelegate.swift
//  FBLogin Realm
//
//  Created by user141656 on 8/8/18.
//  Copyright © 2018 Ryan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FacebookManager.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true

    }

    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplicationOpenURLOptionsKey: Any] = [:]) -> Bool {
        return FacebookManager.application(app, open: url, options: options)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        if FacebookManager.isLoggedin() { print("facebook logged in") }
    }

}
