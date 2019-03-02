//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import ViewStateCore

protocol ___VARIABLE_moduleName___ControllerViewBridgeProtocol: ___VARIABLE_moduleName___ControllerProtocol {
    var viewportHolders: [ViewSubscriberHolderProtocol] { get }
}

extension ___VARIABLE_moduleName___ControllerViewBridgeProtocol {
    var viewports: [ViewStateSubscriber] {
    	return viewportHolders.compactMap { $0 as? ViewStateSubscriber }
    }
}