//
//  SearchUserBuilderProtocol.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import ModuleX

public protocol SearchUserModuleInterface: ModuleInterface {
    var presenter: SearchUserPresenterProtocol? { get }
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

public protocol SearchUserBuilderProtocol {
    func build() -> SearchUserModuleInterface
}
