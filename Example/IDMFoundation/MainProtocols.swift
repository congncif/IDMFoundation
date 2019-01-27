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

public protocol MainBuilderProtocol: ModuleBuilderProtocol {
    func find(from source: ModuleInterface) -> MainModuleInterface?
}
