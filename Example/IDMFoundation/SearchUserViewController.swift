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
    public var output: SearchUserOutputProtocol?

    var router: SearchUserRouterProtocol!

    var presenter: SearchUserPresenterProtocol!
    var integrator: SearchUserAbstractIntegrator!

    var viewports: [ViewStateSubscriber] = []

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Keep this at end of viewDidLoad

        if let viewport = view as? ViewStateSubscriber {
            viewports.append(viewport)
        }
        
        startView()
    }

    public override func viewDidFinishLayout() {
        performSearch(query: state.currentQuery, displayer: self)
    }

    public func start(with query: String) {
        presenter.start(with: query)
    }

    deinit {
        print("Search dealloced")
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
        output?.userDidSelect(model)
        router?.closeSearchUserModule()
    }
}
