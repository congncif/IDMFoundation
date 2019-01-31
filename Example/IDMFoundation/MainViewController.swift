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

public class MainViewController: UIViewController, MainModuleInterface {
    public var presenter: MainPresenterProtocol?
    
    var mainView: MainView {
        return view as! MainView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // Keep this at end of viewDidLoad
        subscribeStateChange(state)
    }
}

extension MainViewController {
    @IBAction func searchButtonDidTap() {
        presenter?.searchUser(query: self.state.query ?? "")
    }
    
    @IBAction func textFieldDidChange(_ textField: UITextField) {
        self.state.query = mainView.searchField.text
    }
}

extension MainViewController: ViewStateSubscriber, ViewStateRenderable {
    public func render(state: ViewState) {
        mainView.searchField.text = self.state.query
        mainView.searchButton.isEnabled = !self.state.query.isNoValue
        mainView.selectedUserLabel.text = self.state.selectedUser?.name
    }
}