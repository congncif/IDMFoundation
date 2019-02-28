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

public class ___VARIABLE_moduleName___ViewController: UIViewController, ___VARIABLE_moduleName___ControllerProtocol, ___VARIABLE_moduleName___ModuleInterface {
	public var output: ___VARIABLE_moduleName___OutputProtocol?

	var router: ___VARIABLE_moduleName___RouterProtocol!

	var presenter: ___VARIABLE_moduleName___PresenterProtocol!
	var integrator: ___VARIABLE_moduleName___AbstractIntegrator!

	var viewports: [ViewStateSubscriber] = []

	public override func viewDidLoad() {
        super.viewDidLoad()

        // Hack to use Interface Builder
        if let viewport = view as? ViewStateSubscriber {
            viewports.append(viewport)
        }

        startView()
    }
}
