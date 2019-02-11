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

/// Use DependencyBridge to inject abstract `presenter` and `integrator`. 
/// They are Swift types so cannot declare as Objective C types.
/// Use this if you want to use UIStoryboard as Builder. Then connect Bridge to ViewController via Storyboard.
/// In ___VARIABLE_moduleName___ViewController, replace ___VARIABLE_moduleName___ControllerProtocol by ___VARIABLE_moduleName___ControllerBridgeProtocol.

class ___VARIABLE_moduleName___DependencyBridge: NSObject {
    var presenter: ___VARIABLE_moduleName___PresenterProtocol!
    var integrator: ___VARIABLE_moduleName___AbstractIntegrator!
}

protocol ___VARIABLE_moduleName___ControllerBridgeProtocol: ___VARIABLE_moduleName___ControllerProtocol {
    var bridge: ___VARIABLE_moduleName___DependencyBridge! { get }
}

extension ___VARIABLE_moduleName___ControllerBridgeProtocol {
    var presenter: ___VARIABLE_moduleName___PresenterProtocol! { return bridge.presenter }
    var integrator: ___VARIABLE_moduleName___AbstractIntegrator! { return bridge.integrator }
}