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
import ViewStateCore

public class ___VARIABLE_moduleName___Presenter: ___VARIABLE_moduleName___PresenterProtocol {
	public var router: ___VARIABLE_moduleName___RouterProtocol

	public private(set) var state: ___VARIABLE_moduleName___ViewState

    public init(router: ___VARIABLE_moduleName___RouterProtocol) {
    	self.router = router
    	
    	let newState = ___VARIABLE_moduleName___ViewState()
    	state = newState
    }
}
