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
        let logoutButton = FacebookManager.loginButton()
        logoutButton.center = self.view.center
        self.view.addSubview(logoutButton)
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if FacebookManager.isLoggedin() {
            //go to app
            return
        }
        performSegue(withIdentifier: "showLogin", sender: nil)
        //go to login
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
