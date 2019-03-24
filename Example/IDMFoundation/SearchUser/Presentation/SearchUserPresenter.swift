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

@objcMembers class SearchUserViewState: ViewState {
    fileprivate(set) dynamic var query: String?
    fileprivate(set) dynamic var users: [SearchUserModel] = []
}

class SearchUserPresenter: SearchUserPresenterProtocol {
    var loadingHandler: LoadingProtocol!

    fileprivate let state: SearchUserViewState
    fileprivate var errorHandlingProxy: ErrorHandlingProxy

    init(state: SearchUserViewState = SearchUserViewState()) {
        self.state = state
        errorHandlingProxy = ErrorHandlingProxy()
    }

    var errorHandler: ErrorHandlingProtocol {
        return errorHandlingProxy
    }

    func register(errorHandler: ErrorHandlingProtocol,
                  priority: ErrorHandlingProxy.HandlingPriority = .default,
                  where condition: ((Error?) -> Bool)? = nil) {
        errorHandlingProxy.addHandler(errorHandler, priority: priority, where: condition)
    }
    
    func register<E>(dedicatedErrorHandler handler: DedicatedErrorHandler<E>,
                  priority: ErrorHandlingProxy.HandlingPriority = .default,
                  where condition: ((E) -> Bool)? = nil) {
        errorHandlingProxy.addDedicatedHandler(handler, priority: priority, where: condition)
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
