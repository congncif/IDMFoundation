//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import UIKit

final class ___VARIABLE_moduleName___Segue: UIStoryboardSegue, ___VARIABLE_moduleName___RouterProtocol {
//	private struct <#TargetModuleOutputProxy#>: <#TargetModuleOutputProtocol#> {
//      weak var output: ___VARIABLE_moduleName___ModuleInterface?
//  }
}

extension ___VARIABLE_moduleName___Segue {
//	var target: <#TargetModuleInterface#>? {
//		return destination as? <#TargetModuleInterface#>
//  }

    var current: ___VARIABLE_moduleName___ModuleInterface? {
        return source as? ___VARIABLE_moduleName___ModuleInterface
    }

    override var identifier: String? {
        return self.typeName
    }
}
