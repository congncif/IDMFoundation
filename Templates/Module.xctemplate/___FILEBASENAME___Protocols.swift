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

// Come from outside

public protocol ___VARIABLE_moduleName___ModuleInterface: ModuleInterface, ___VARIABLE_moduleName___InputProtocol {
	// Declare methods to call from outside module scope
}

// Internal

protocol ___VARIABLE_moduleName___ControllerProtocol {
    // Once you use Storyboard segue, you might not need a router.
    var router: ___VARIABLE_moduleName___RouterProtocol? { get }

    var presenter: ___VARIABLE_moduleName___PresenterProtocol! { get }
    var integrator: ___VARIABLE_moduleName___AbstractIntegrator! { get }

    // Declare methods to work internal module
}

protocol ___VARIABLE_moduleName___PresenterProtocol {
    var state: ___VARIABLE_moduleName___ViewState { get }

    var dataProcessor: DataProcessor<___VARIABLE_moduleName___ResponseModel> { get }
}

// Go in module

// Once you have a Storyboard, you might use it as a builder alternatively.
public protocol ___VARIABLE_moduleName___BuilderProtocol {
    func build() -> ___VARIABLE_moduleName___ModuleInterface
}

// Go out module

protocol ___VARIABLE_moduleName___RouterProtocol: ___VARIABLE_moduleName___OutputProtocol {
	// RouterProtocol as a composite protocol of the output
}

// In/Out

/// Each of methods to go in or go out module is declared as a protocol. This promotes Interface Segregation Principle.

public protocol ___VARIABLE_moduleName___InputProtocol {
	// Declare method to come in from outside module, equivalent to a medhod of ___VARIABLE_moduleName___ModuleInterface
}

protocol ___VARIABLE_moduleName___OutputProtocol {
	// Declare method to go out module, equivalent to a medhod of ___VARIABLE_moduleName___RouterProtocol
}