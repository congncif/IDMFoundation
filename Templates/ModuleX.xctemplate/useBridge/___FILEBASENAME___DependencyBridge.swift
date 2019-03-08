//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import ViewStateCore

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