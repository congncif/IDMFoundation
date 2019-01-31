//
//  SearchUserBuilderProtocol.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMFoundation
import ModuleX

public protocol SearchUserModuleInterface: ModuleInterface {
    var presenter: SearchUserPresenterProtocol? { get }
}

public protocol SearchUserPresenterProtocol {
    var state: SearchUserViewState { get }

    func start(with query: String)
    func search(loader: LoadAndErrorHandlerProtocol)
    func selectUser(_ user: SearchUserModel)
}

public protocol SearchUserBuilderProtocol {
    func build() -> SearchUserModuleInterface
}

public protocol SearchUserRouterProtocol: RouterProtocol {
    func userDidSelect(_ user: SearchUserModel)
}

extension SearchUserModuleInterface {
    public var state: SearchUserViewState {
        var _state: SearchUserViewState
        if let currentState = presenter?.state {
            _state = currentState
        } else {
            assertionFailure()
            _state = SearchUserViewState()
        }
        return _state
    }
}
