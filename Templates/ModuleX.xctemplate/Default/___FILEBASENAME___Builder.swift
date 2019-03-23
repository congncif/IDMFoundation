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
        let view = ___VARIABLE_moduleName___View(frame: UIScreen.main.bounds)

        let viewController = ___VARIABLE_moduleName___ViewController(customView: view)

        let router = ___VARIABLE_moduleName___Router()

        let presenter = ___VARIABLE_moduleName___Presenter()
        
        view.actionDelegate = viewController

        viewController.presenter = presenter
        viewController.router = router
        // viewController.integrator = ___VARIABLE_moduleName___IntegratorFactory.produce()

        presenter.loadingHandler = view.asLoadingHandler()
        presenter.register(view: view)
        presenter.register(errorHandler: viewController.asErrorHandler())

        router.sourceModule = viewController
        // <#router.nextBuilder = NextBuilder()#>

        return viewController
    }
}
