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
    var loadingHandler: LoadingProtocol!

    fileprivate let state: SearchUserViewState
    fileprivate var errorHandlingProxy: ErrorHandlingProxy

    init(state: SearchUserViewState = SearchUserViewState()) {
        self.state = state
        errorHandlingProxy = ErrorHandlingProxy()
    }

    var errorHandler: ErrorHandlingProtocol! {
        return errorHandlingProxy
    }

    func register(errorHandler: ErrorHandlingProtocol,
                  where condition: ((Error?) -> Bool)? = nil) {
        errorHandlingProxy.addHandler(errorHandler, where: condition)
    }

    func register(view: SearchUserViewViewProtocol) {
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
