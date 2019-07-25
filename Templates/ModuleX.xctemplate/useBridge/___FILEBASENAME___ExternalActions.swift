//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import UIKit

public enum ___VARIABLE_moduleName___Destination: String {
	case next
}

extension ___VARIABLE_moduleName___ViewActionDelegate where Self: ___VARIABLE_moduleName___ControllerProtocol, Self: ___VARIABLE_moduleName___ModuleInterface {}

extension ___VARIABLE_moduleName___ViewActionDelegate where Self: UIViewController {
	func gotoNext() {
		self.performSegue(type: .next, sender: self)
	}
}

extension UIViewController {
	func performSegue(type: ___VARIABLE_moduleName___Destination, sender: Any?) {
        self.performSegue(withIdentifier: type.rawValue, sender: sender)
	}
}