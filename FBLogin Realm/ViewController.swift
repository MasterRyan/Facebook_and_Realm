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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if FacebookManager.isLoggedin() {
            dismissPage()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(dismissPage), name: .UIApplicationWillEnterForeground , object: nil)
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

