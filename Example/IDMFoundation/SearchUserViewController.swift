//
//  SearchUserViewController.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation
import ModuleX
import UIKit
import ViewStateCore
import SDWebImage

public class SearchUserViewController: UIViewController, SearchUserModuleInterface {
    public var presenter: SearchUserPresenterProtocol?

    @IBOutlet weak var tableView: UITableView!

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Keep this at end of viewDidLoad
        subscribeStateChange(state)
    }

    public override func viewDidFinishLayout() {
        presenter?.search(loader: self)
    }
}

extension SearchUserViewController {
    @IBAction func refreshButtonDidTap() {
        presenter?.search(loader: self)
    }
}

extension SearchUserViewController {
    var users: [SearchUserModel] {
        return state.users
    }
}

extension SearchUserViewController: ViewStateSubscriber, ViewStateRenderable {
    public func render(state: ViewState) {
        tableView.reloadData()
    }
}

// MARK: - TableView

extension SearchUserViewController: UITableViewDataSource, UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let model = users[indexPath.row]

        let imageView = cell.viewWithTag(1) as? UIImageView
        imageView?.image = nil
        if let avatar = model.avatar {
            let url = URL(string: avatar)
            imageView?.sd_setImage(with: url)
        }

        let titleLabel = cell.viewWithTag(2) as? UILabel
        titleLabel?.text = model.name

        let homeLabel = cell.viewWithTag(3) as? UILabel
        let homeUrl = model.profileUrl
        homeLabel?.text = homeUrl

        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = users[indexPath.row]
        presenter?.selectUser(model)
    }
}
