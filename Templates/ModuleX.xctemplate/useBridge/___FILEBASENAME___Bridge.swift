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

class ___VARIABLE_moduleName___Bridge: ___VARIABLE_moduleName___DependencyBridge {
    override init() {
        super.init()
        presenter = ___VARIABLE_moduleName___Presenter()
        // integrator = ___VARIABLE_moduleName___IntegratorFactory.produce()
    }

    @IBOutlet weak var view: AnyObject? {
        didSet {
            if let _view = view as? ___VARIABLE_moduleName___ViewProtocol {
                presenter.register(view: _view)
            }
        }
    }
	
	@IBOutlet weak var loadingHandler: AnyObject? {
        didSet {
            if let handler = loadingHandler as? LoadingObjectProtocol {
                presenter.loadingHandler = handler.asValueType()
            }
        }
    }

    @IBOutlet weak var errorHandler: AnyObject? {
        didSet {
            if let handler = errorHandler as? ErrorHandlingObjectProtocol, let _presenter = presenter as? ___VARIABLE_moduleName___Presenter {
                _presenter.register(errorHandler: handler.asValueType())
            }
        }
    }
}