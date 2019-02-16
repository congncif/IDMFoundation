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

/// Come from outside

public protocol ___VARIABLE_moduleName___ModuleInterface: ModuleInterface, ___VARIABLE_moduleName___InputProtocol {
	var output: ___VARIABLE_moduleName___OutputProtocol? { get set }
}

/// Internal

protocol ___VARIABLE_moduleName___ControllerProtocol {
    var presenter: ___VARIABLE_moduleName___PresenterProtocol! { get }
    var integrator: ___VARIABLE_moduleName___AbstractIntegrator! { get }

    // Declare methods to work internal module
}

protocol ___VARIABLE_moduleName___PresenterProtocol {
    var state: ___VARIABLE_moduleName___ViewState { get }

    var dataProcessor: DataProcessor<___VARIABLE_moduleName___ResponseModel> { get }
}

/// Optionals

protocol ___VARIABLE_moduleName___RouterProtocol {}

/// In/Out
/// Each of methods to go in or go out module is declared as a protocol. This promotes Interface Segregation Principle.

public protocol ___VARIABLE_moduleName___InputProtocol {
	// Declare method to come in from outside module
}

public protocol ___VARIABLE_moduleName___OutputProtocol {
	// Declare method to go out module
}
