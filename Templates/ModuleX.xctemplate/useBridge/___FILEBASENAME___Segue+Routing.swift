//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import UIKit

extension ___VARIABLE_moduleName___Segue: ___VARIABLE_moduleName___RouterProtocol {
//	private struct <#TargetModuleOutputAdapter#>: <#TargetModuleOutputProtocol#> {
//      weak var input: ___VARIABLE_moduleName___ModuleInterface?
//  }
}

extension ___VARIABLE_moduleName___Segue {
//	var target: <#TargetModuleInterface#>? {
//		return destination as? <#TargetModuleInterface#>
//  }

    var current: ___VARIABLE_moduleName___ModuleInterface? {
        return source as? ___VARIABLE_moduleName___ModuleInterface
    }
}
