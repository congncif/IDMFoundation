//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import UIKit

class ___VARIABLE_moduleName___Segue: UIStoryboardSegue, ___VARIABLE_moduleName___RouterProtocol {

//	var target: ___VARIABLE_targetModuleName___ModuleInterface? {
//		return destination as? ___VARIABLE_targetModuleName___ModuleInterface
//  }

	var current: ___VARIABLE_moduleName___ModuleInterface? {
        return source as? ___VARIABLE_moduleName___ModuleInterface
    }

    override var identifier: String? {
        return self.typeName
    }
}