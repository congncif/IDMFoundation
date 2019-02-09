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
import UIKit
import ViewStateCore

public class ___VARIABLE_moduleName___ViewController: UIViewController, ___VARIABLE_moduleName___ControllerProtocol, ___VARIABLE_moduleName___ModuleInterface {
	var presenter: ___VARIABLE_moduleName___PresenterProtocol!
	var router: ___VARIABLE_moduleName___RouterProtocol!

	var inregrator: ___VARIABLE_moduleName___AbstractIntegrator!

	public override func viewDidLoad() {
        super.viewDidLoad()

        // <#Subscribe ViewState changes here#>
    }
}
