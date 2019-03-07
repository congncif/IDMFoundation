//
//  SearchUserPresenter.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation
import ModuleX
import ViewStateCore

class SearchUserViewState: ViewState {
    @objc fileprivate(set) dynamic var query: String?
    @objc fileprivate(set) dynamic var users: [SearchUserModel] = []
}

class SearchUserPresenter: SearchUserPresenterProtocol {
    weak var dataLoadingMonitor: LoadingMonitorProtocol?

    fileprivate let state: SearchUserViewState

    init(state: SearchUserViewState = SearchUserViewState()) {
        self.state = state
    }

    func register(view: SearchViewViewProtocol) {
        state.register(subscriber: view)
    }

    func currentQuery() -> String {
        return state.query.unwrapped()
    }

    func user(at index: Int) -> SearchUserModel {
        return state.users[index]
    }
}

extension SearchUserPresenter {
    func start(with query: String) {
        state.query = query
    }
    
    func setUsers(_ users: [SearchUserModel]) {
        state.users = users
    }
}
