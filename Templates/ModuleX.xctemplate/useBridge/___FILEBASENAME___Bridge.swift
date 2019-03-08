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

    @IBOutlet weak var viewBridge: AnyObject? {
        set {
            if let view = newValue as? ___VARIABLE_moduleName___ViewProtocol {
                presenter.register(view: view)
            }
        }

        get { return nil } // trick for setter only property
    }
	
	@IBOutlet weak var loadingHandler: AnyObject? {
        set {
            if let handler = newValue as? LoadingObjectProtocol {
                presenter.loadingHandler = handler.asValueType()
            }
        }

        get { return nil } // trick for setter only property
    }

    override init() {
    	super.init()
        presenter = ___VARIABLE_moduleName___Presenter()
        // integrator = ___VARIABLE_moduleName___IntegratorFactory.produce()
    }
}