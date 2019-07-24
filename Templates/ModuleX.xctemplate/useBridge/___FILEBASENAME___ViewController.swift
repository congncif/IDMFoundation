//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import UIKit
import ViewStateCore

final class ___VARIABLE_moduleName___ViewController: UIViewController, ___VARIABLE_moduleName___ControllerBridgeProtocol, ___VARIABLE_moduleName___ModuleInterface {
	public var output: ___VARIABLE_moduleName___OutputProtocol?
	public var router: ___VARIABLE_moduleName___RouterProtocol?

    var dependencyBridge: ___VARIABLE_moduleName___DependencyBridge!

	override func viewDidLoad() {
        super.viewDidLoad()
		activateView()
    }
}

extension ___VARIABLE_moduleName___ViewController: ___VARIABLE_moduleName___ViewActionDelegate {}
