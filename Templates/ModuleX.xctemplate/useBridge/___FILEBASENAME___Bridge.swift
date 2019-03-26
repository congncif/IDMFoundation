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
    private let _presenter = ___VARIABLE_moduleName___Presenter()
    
    @IBOutlet private weak var viewController: ___VARIABLE_moduleName___ViewController!
    @IBOutlet private weak var view: ___VARIABLE_moduleName___View!

    var presenter: ___VARIABLE_moduleName___PresenterProtocol! { return _presenter }
    var integrator: ___VARIABLE_moduleName___AbstractIntegrator!

    override init() {
        super.init()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewController.dependencyBridge = self
        
        _presenter.view = view
        _presenter.loadingHandler = view.asLoadingHandler()
        _presenter.register(errorHandler: viewController.asErrorHandler())
        
        view.actionDelegate = viewController
    }
}