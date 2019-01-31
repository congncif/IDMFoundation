//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import IDMCore
import IDMFoundation
import ModuleX
import ViewStateCore

// Business

public protocol ___VARIABLE_moduleName___ModuleInterface {
	var presenter: ___VARIABLE_moduleName___PresenterProtocol? { get }
}

public protocol ___VARIABLE_moduleName___PresenterProtocol {
    var state: ___VARIABLE_moduleName___ViewState { get }
}

// Go in module

public protocol ___VARIABLE_moduleName___BuilderProtocol {
    func build() -> ___VARIABLE_moduleName___ModuleInterface
}

// Go out module

public protocol ___VARIABLE_moduleName___RouterProtocol: RouterProtocol {}

// Extensions

extension ___VARIABLE_moduleName___ModuleInterface {
    public var state: ___VARIABLE_moduleName___ViewState {
        var _state: ___VARIABLE_moduleName___ViewState
        if let currentState = presenter?.state {
            _state = currentState
        } else {
            assertionFailure()
            _state = ___VARIABLE_moduleName___ViewState()
        }
        return _state
    }
}
