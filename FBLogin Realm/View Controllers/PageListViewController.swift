//
//  PageListViewController.swift
//  FBLogin Realm
//
//  Created by user141656 on 8/8/18.
//  Copyright © 2018 Ryan. All rights reserved.
//

import UIKit
import RealmSwift

class PageListViewController: UIViewController {

    @IBOutlet weak var logoutHolder: UIView!
    @IBOutlet weak var table: UITableView!

    let logoutButton = FacebookManager.loginButton()

    var pages: Results<Page>?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.logoutHolder.addSubview(logoutButton)

        FacebookManager.updateListOfPages { [weak self] (pages, _) in
            if let pages = pages {
                self?.pages = pages
            }
            self?.table.reloadData()

        }

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(dismissAnimated),
                                               name: FacebookManager.loggedOutNotification,
                                               object: nil)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let xPos = logoutHolder.bounds.size.width/2
        let yPos = logoutHolder.bounds.size.height/2
        logoutButton.center = CGPoint(x: xPos, y: yPos)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func dismissAnimated() {
        dismiss(animated: true, completion: nil)
    }

}

extension PageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pages?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = pages?[indexPath.row].name
        return cell ?? UITableViewCell()
    }

}
