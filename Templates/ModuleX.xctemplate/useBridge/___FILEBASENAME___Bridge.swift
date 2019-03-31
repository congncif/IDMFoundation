//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import IDMCore
import IDMFoundation

final class ___VARIABLE_moduleName___Bridge: NSObject, ___VARIABLE_moduleName___DependencyBridge {
    private var _presenter = ___VARIABLE_moduleName___Presenter()

    @IBOutlet private weak var viewController: ___VARIABLE_moduleName___ViewController!
    @IBOutlet private weak var contentView: ___VARIABLE_moduleName___View!
    @IBOutlet private weak var navigationView: ___VARIABLE_moduleName___NavigationView!

    var presenter: ___VARIABLE_moduleName___PresenterProtocol! { return _presenter }
    var integrator: ___VARIABLE_moduleName___AbstractIntegrator!

    override init() {
        super.init()
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        viewController.loadViewIfNeeded()

        viewController.dependencyBridge = self

        _presenter.actionDelegate = viewController
        _presenter.add(errorHandler: viewController.asErrorHandler())
        _presenter.dataLoadingHandler = contentView.asLoadingHandler()

        _presenter.state.register(subscriberObject: contentView)
        _presenter.state.register(subscriberObject: navigationView)

        navigationView.actionDelegate = viewController
        contentView.actionDelegate = viewController
    }
}
