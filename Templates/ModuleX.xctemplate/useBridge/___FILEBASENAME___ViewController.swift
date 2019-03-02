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

public class ___VARIABLE_moduleName___ViewController: UIViewController, ___VARIABLE_moduleName___ControllerBridgeProtocol, ___VARIABLE_moduleName___ViewActionDelegate, ___VARIABLE_moduleName___ModuleInterface {
	public var output: ___VARIABLE_moduleName___OutputProtocol?

	@IBOutlet var bridge: ___VARIABLE_moduleName___DependencyBridge!

	public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
