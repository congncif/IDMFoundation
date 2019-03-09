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

    @IBOutlet var viewBridge: [AnyObject] {
        set {
            let values = newValue.compactMap {
                $0 as? ___VARIABLE_moduleName___ViewProtocol
            }
            values.forEach {
                presenter.register(view: $0)
            }
        }

        get { return [] } // trick for setter only property
    }
	
	@IBOutlet weak var loadingHandler: AnyObject? {
        set {
            if let handler = newValue as? LoadingObjectProtocol {
                presenter.loadingHandler = handler.asValueType()
            }
        }

        get { return nil } // trick for setter only property
    }

    @IBOutlet var errorHandler: [AnyObject] {
        set {
            let values = newValue.compactMap {
                ($0 as? ErrorHandlingObjectProtocol)?.asValueType()
            }
            presenter.errorHandler = ErrorHandlingProxy(handlers: values)
        }

        get { return [] } // trick for setter only property
    }
}