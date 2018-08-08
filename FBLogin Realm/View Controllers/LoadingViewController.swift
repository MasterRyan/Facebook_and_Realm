//
//  LoadingViewController.swift
//  FBLogin Realm
//
//  Created by user141656 on 8/8/18.
//  Copyright © 2018 Ryan. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if FacebookManager.isLoggedin() {
            performSegue(withIdentifier: "enterApp", sender: nil)
            return
        }
        performSegue(withIdentifier: "showLogin", sender: nil)
        //go to login
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
