//
//  MainView.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 3/2/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import ViewStateCore

class MainView: UIView, MainViewProtocol {
    weak var actionDelegate: MainViewActionDelegate?

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var selectedUserLabel: UILabel!

    @IBAction func searchButtonDidTap() {
        actionDelegate?.search()
    }

    @IBAction func searchFieldDidChange(_ textField: UITextField) {
        actionDelegate?.searchQueryDidChange(textField.text!)
    }
}

extension MainView: ViewStateRenderable {
    public func render(state: ViewState) {
        if let state = state as? MainViewState.QueryState {
            searchField.text = state.query
            searchButton.isEnabled = !state.query.isNoValue
        }
        else if let state = state as? MainViewState.SelectionState {
            selectedUserLabel.text = state.selectedUser?.name
        }
    }
}
