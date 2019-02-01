//
//  MainViewState.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 2/1/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import ViewStateCore

public class MainViewState: ViewState {
    public class QueryState: ViewState {
        @objc public fileprivate(set) dynamic var query: String?
    }
    
    public class SelectionState: ViewState {
        @objc public fileprivate(set) dynamic var selectedUser: SearchUserModel?
    }
    
    @objc public fileprivate(set) dynamic var queryState = QueryState()
    @objc public fileprivate(set) dynamic var selectionState = SelectionState()
}

extension MainViewState {
    public var currentQuery: String {
        return queryState.query ?? ""
    }
}

extension MainPresenterProtocol {
    public func selectUser(_ user: SearchUserModel) {
        state.selectionState.selectedUser = user
    }
    
    public func setQuery(_ query: String?) {
        state.queryState.query = query
    }
}
