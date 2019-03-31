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

public final class ___VARIABLE_moduleName___ViewController: UIViewController, ___VARIABLE_moduleName___ControllerBridgeProtocol, ___VARIABLE_moduleName___ModuleInterface {
    public var output: ___VARIABLE_moduleName___OutputProtocol?

    var dependencyBridge: ___VARIABLE_moduleName___DependencyBridge!

    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ___VARIABLE_moduleName___ViewController: ___VARIABLE_moduleName___ViewActionDelegate {}
