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

// Go in module
// Once you have a Storyboard, you might use it as a builder alternatively. See more Dependency Bridge.
public protocol ___VARIABLE_moduleName___BuilderProtocol {
    func build() -> ___VARIABLE_moduleName___ModuleInterface
}

public struct ___VARIABLE_moduleName___Builder: ___VARIABLE_moduleName___BuilderProtocol {    
    public func build() -> ___VARIABLE_moduleName___ModuleInterface {
        let viewController = ___VARIABLE_moduleName___ViewController() // FIXME: - Init view controller
        
        let router = ___VARIABLE_moduleName___Router()
        router.sourceModule = viewController
        // <#router.nextBuilder = NextBuilder()#>
        
        let presenter = ___VARIABLE_moduleName___Presenter()
        
        viewController.presenter = presenter
        viewController.router = router
        
        // viewController.integrator = ___VARIABLE_moduleName___IntegratorFactory.getIntegrator()

        return viewController
    }
}
