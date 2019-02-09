//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import ModuleX
import SiFUtilities

public struct ___VARIABLE_moduleName___Builder: ___VARIABLE_moduleName___BuilderProtocol {    
    public func build() -> ___VARIABLE_moduleName___ModuleInterface {
        let viewController = ___VARIABLE_moduleName___ViewController() // FIXME: - Init view controller
        
        let router = ___VARIABLE_moduleName___Router()
        router.sourceModule = viewController
        // <#router.nextBuilder = NextBuilder()#>
        
        let presenter = ___VARIABLE_moduleName___Presenter()
        
        viewController.presenter = presenter
        viewController.router = router
        
        return viewController
    }
}
