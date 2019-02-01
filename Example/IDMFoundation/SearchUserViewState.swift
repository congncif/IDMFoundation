//
//  SearchUserViewState.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 2/1/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import ViewStateCore

public class SearchUserViewState: ViewState {
    @objc public fileprivate(set) dynamic var query: String?
    @objc public fileprivate(set) dynamic var users: [SearchUserModel] = []
}

extension SearchUserViewState {
    public var currentQuery: String {
        return query ?? ""
    }
}

extension SearchUserPresenterProtocol {
    public func start(with query: String) {
        state.query = query
    }

    public func setUsers(_ users: [SearchUserModel]) {
        state.users = users
    }
}
