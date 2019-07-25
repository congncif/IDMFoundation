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

/**
 * NOTE: Convenience always comes with limitations. 
 * Using Storyboard Segue & Dependency Bridge means you are dealing with Internal Routing.
 * If you would like to strongly modularize, you should use Builder & Router instead.
 **/

/// Come from outside

public protocol ___VARIABLE_moduleName___ModuleInterface: ModuleInterface, ___VARIABLE_moduleName___InputProtocol {
    var output: ___VARIABLE_moduleName___OutputProtocol? { get set }
    var router: ___VARIABLE_moduleName___RouterProtocol? { get set }
}

public protocol ___VARIABLE_moduleName___BuilderProtocol {
    func build() -> ___VARIABLE_moduleName___ModuleInterface
}

/// In/Out

// Declare methods come in from outside module
public protocol ___VARIABLE_moduleName___InputProtocol {}

// Declare methods call back from previous module
public protocol ___VARIABLE_moduleName___OutputProtocol {}

// Declare methods go out to next module
public protocol ___VARIABLE_moduleName___RouterProtocol {}

/// Internal

protocol ___VARIABLE_moduleName___ViewActionDelegate: AnyObject {
    func activateView()
    
    func gotoNext()
}

protocol ___VARIABLE_moduleName___ViewProtocol: ViewStateSubscriber {
    var actionDelegate: ___VARIABLE_moduleName___ViewActionDelegate? { get }
}

protocol ___VARIABLE_moduleName___ControllerProtocol {
    var presenter: ___VARIABLE_moduleName___PresenterProtocol! { get }
    var integrator: ___VARIABLE_moduleName___AbstractIntegrator! { get }

    // Declare methods to work internal module
}

protocol ___VARIABLE_moduleName___PresenterProtocol {
    var actionDelegate: ___VARIABLE_moduleName___ViewActionDelegate? { get }
    var errorHandler: ErrorHandlingProtocol { get }

    var dataLoadingHandler: LoadingProtocol! { get }
    var dataResponseHandler: DataProcessor<___VARIABLE_moduleName___ResponseModel> { get }
}
