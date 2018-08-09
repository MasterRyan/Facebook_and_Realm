//
//  ViewController.swift
//  FBLogin Realm
//
//  Created by user141656 on 8/8/18.
//  Copyright © 2018 Ryan. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = FacebookManager.loginButton()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)

        registerNotification()
        
    }

    deinit {
        removeNotifications()
    }

    func registerNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(dismissPage),
                                               name: FacebookManager.loggedInNotification,
                                               object: nil)
    }

    func removeNotifications() {
        NotificationCenter.default.removeObserver(self, name: .UIApplicationWillEnterForeground, object: nil)
    }

    @objc func dismissPage() {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
