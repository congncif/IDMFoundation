//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import UIKit

class ___VARIABLE_moduleName___Segue: UIStoryboardSegue, ___VARIABLE_moduleName___OutputProtocol {

//	var target: ___VARIABLE_targetModuleName___InputProtocol? {
//		return destination as? ___VARIABLE_targetModuleName___InputProtocol
//  }

    override var identifier: String? {
        return self.typeName
    }
}