//
//  MainViewController.swift
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

public class MainViewController: UIViewController, MainControllerProtocol, MainModuleInterface {
    public weak var output: MainOutputProtocol?

    var router: MainRouterProtocol?
    var presenter: MainPresenterProtocol!

    var mainView: MainView {
        return view as! MainView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // Keep this at end of viewDidLoad
        mainView.subscribeStateChange(state)
    }
}

extension MainViewController {
    @IBAction func searchButtonDidTap() {
        let query = state.currentQuery
        router?.openSearchModule(with: query)
    }

    @IBAction func textFieldDidChange(_ textField: UITextField) {
        presenter.setQuery(textField.text)
    }
}

extension MainViewController: SearchUserOutputProtocol {
    public func userDidSelect(_ user: SearchUserModel) {
        presenter.selectUser(user)
    }
}
