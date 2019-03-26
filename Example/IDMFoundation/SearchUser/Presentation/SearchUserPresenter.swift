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
    fileprivate let state: SearchUserViewState
    fileprivate var errorHandlingProxy: ErrorHandlingProxy

    fileprivate weak var internalView: SearchUserViewViewProtocol?

    init(state: SearchUserViewState = SearchUserViewState()) {
        self.state = state
        errorHandlingProxy = ErrorHandlingProxy()
    }

    var loadingHandler: LoadingProtocol!

    var view: SearchUserViewViewProtocol? {
        get {
            return internalView
        }

        set {
            if let oldValue = internalView {
                state.unregister(subscriber: oldValue)
            }
            if let value = newValue {
                state.register(subscriber: value)
            }
            internalView = newValue
        }
    }

    var errorHandler: ErrorHandlingProtocol {
        return errorHandlingProxy
    }
}

extension SearchUserPresenter {
    func register(errorHandler: ErrorHandlingProtocol,
                  priority: ErrorHandlingProxy.HandlingPriority = .default,
                  where condition: ((Error?) -> Bool)? = nil) {
        errorHandlingProxy.addHandler(errorHandler, priority: priority, where: condition)
    }

    func register<ErrorType>(dedicatedErrorHandler handler: DedicatedErrorHandler<ErrorType>,
                             priority: ErrorHandlingProxy.HandlingPriority = .default,
                             where condition: ((ErrorType) -> Bool)? = nil) {
        errorHandlingProxy.addDedicatedHandler(handler, priority: priority, where: condition)
    }

    func register(viewStateListener listener: ViewStateSubscriber) {
        state.register(subscriber: listener)
    }
}

extension SearchUserPresenter {
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
