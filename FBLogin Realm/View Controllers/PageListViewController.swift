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

    var pages: Results<Page>?

    override func viewDidLoad() {
        super.viewDidLoad()
        let logoutButton = FacebookManager.loginButton()
        logoutButton.center = self.logoutHolder.center
        self.logoutHolder.addSubview(logoutButton)

        FacebookManager.updateListOfPages { [weak self] (pages, _) in
            if let pages = pages {
                self?.pages = pages
            }
            self?.table.reloadData()

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
