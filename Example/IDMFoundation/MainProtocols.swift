//
//  MainBuilderProtocol.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import ModuleX

public protocol MainModuleInterface: ModuleInterface {
    var presenter: MainPresenterProtocol? { get }
}

public protocol MainPresenterProtocol {
    var state: MainViewState { get }

    func searchUser(query: String)
    func selectUser(_ user: SearchUserModel)
}

// Go in module

public protocol MainBuilderProtocol: ModuleBuilderProtocol {
    func find(from source: ModuleInterface) -> MainModuleInterface?
}

// Go out module

public protocol MainRouterProtocol: RouterProtocol {
    func openSearchModule(with query: String)
}

// Extensions

extension MainModuleInterface {
    public var state: MainViewState {
        var _state: MainViewState
        if let currentState = presenter?.state {
            _state = currentState
        } else {
            assertionFailure()
            _state = MainViewState()
        }
        return _state
    }
}
