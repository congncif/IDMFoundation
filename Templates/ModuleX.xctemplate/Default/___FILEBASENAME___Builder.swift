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
        let contentView = ___VARIABLE_moduleName___View(frame: UIScreen.main.bounds)

        let viewController = ___VARIABLE_moduleName___ViewController(customView: contentView)

        let navigationView = ___VARIABLE_moduleName___NavigationView()
        navigationView.navigationItem = viewController.navigationItem

        let router = ___VARIABLE_moduleName___Router()

        var presenter = ___VARIABLE_moduleName___Presenter()

        viewController.presenter = presenter
        viewController.router = router
        // viewController.integrator = ___VARIABLE_moduleName___IntegratorFactory.getIntegrator()

        presenter.actionDelegate = viewController
        presenter.add(errorHandler: viewController.asErrorHandler())
        presenter.dataLoadingHandler = contentView.asLoadingHandler()

        presenter.state.register(subscriberObject: contentView)
        presenter.state.register(subscriberObject: navigationView, retain: true)

        contentView.actionDelegate = viewController
        navigationView.actionDelegate = viewController

        router.sourceModule = viewController
        // <#router.nextBuilder = NextBuilder()#>

        return viewController
    }
}
