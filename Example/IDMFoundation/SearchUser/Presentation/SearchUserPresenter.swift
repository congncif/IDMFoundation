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

@objcMembers
class SearchUserViewState: ViewState {
    fileprivate(set) dynamic var query: String?
    fileprivate(set) dynamic var users: [SearchUserModel] = []
}

class SearchUserPresenter: SearchUserPresenterProtocol, StatefulPresenterProtocol, MultipleErrorHandlingProtocol {
    let state: SearchUserViewState
    var errorHandlingProxy: ErrorHandlingProxy

    init(state: SearchUserViewState = SearchUserViewState()) {
        self.state = state
        errorHandlingProxy = ErrorHandlingProxy()
    }
    
    var actionDelegate: SearchUserViewActionDelegate?
    var dataLoadingHandler: LoadingProtocol!
}

extension SearchUserPresenter {
    func start(with query: String) {
        state.query = query
    }
    
    func currentQuery() -> String {
        return state.query.unwrapped()
    }

    func user(at index: Int) -> SearchUserModel {
        return state.users[index]
    }
    
    func setUsers(_ users: [SearchUserModel]) {
        state.users = users
    }
}
