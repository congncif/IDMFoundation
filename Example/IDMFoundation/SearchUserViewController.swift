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
import SDWebImage
import UIKit
import ViewStateCore

public class SearchUserViewController: UIViewController, SearchUserControllerProtocol, SearchUserModuleInterface {
    var router: SearchUserRouterProtocol!
    var presenter: SearchUserPresenterProtocol!

    public var searchUserIntegrator: SearchUserAbstractIntegrator!

    @IBOutlet var usersArrayController: SearchUserArrayController!

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Keep this at end of viewDidLoad
        usersArrayController.subscribeStateChange(state)
    }

    public override func viewDidFinishLayout() {
        performSearch(query: state.currentQuery, displayer: self)
    }
    
    public func start(with query: String) {
        presenter.start(with: query)
    }
}

extension SearchUserViewController {
    @IBAction func refreshButtonDidTap() {
        performSearch(query: state.currentQuery, displayer: self)
    }
}

extension SearchUserViewController {
    var users: [SearchUserModel] {
        return state.users
    }
}

// MARK: - TableView

extension SearchUserViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = users[indexPath.row]
        router.userDidSelect(model)
    }
}
