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

public protocol ___VARIABLE_moduleName___ModuleInterface: ModuleInterface {
}

// Business

protocol ___VARIABLE_moduleName___ControllerProtocol {
	var presenter: ___VARIABLE_moduleName___PresenterProtocol! { get }

    // Once you use Storyboard segue, you might not need a router.
    var router: ___VARIABLE_moduleName___RouterProtocol! { get }

    var inregrator: ___VARIABLE_moduleName___AbstractIntegrator! { get }
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

protocol ___VARIABLE_moduleName___RouterProtocol: RouterProtocol {}

