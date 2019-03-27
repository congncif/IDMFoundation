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

/// Come from outside

public protocol ___VARIABLE_moduleName___ModuleInterface: ModuleInterface, ___VARIABLE_moduleName___InputProtocol {
    var output: ___VARIABLE_moduleName___OutputProtocol? { get set }
}

/// In/Out

public protocol ___VARIABLE_moduleName___InputProtocol {
    // Declare method to come in from outside module
}

public protocol ___VARIABLE_moduleName___OutputProtocol {
    // Declare method to go out module
}

/// Internal

protocol ___VARIABLE_moduleName___ViewActionDelegate: AnyObject {
    func viewReady()
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

protocol ___VARIABLE_moduleName___RouterProtocol {}
