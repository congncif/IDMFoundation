//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

class ___VARIABLE_moduleName___Presenter: NSObject, ___VARIABLE_moduleName___PresenterProtocol {
	private(set) var state: ___VARIABLE_moduleName___ViewState

    override init() {    	
    	let newState = ___VARIABLE_moduleName___ViewState()
    	state = newState
        super.init()
    }
}