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

public protocol ___VARIABLE_moduleName___PresenterProtocol {
	
}

public class ___VARIABLE_moduleName___Presenter: ___VARIABLE_moduleName___PresenterProtocol {
	public private(set) var state: ___VARIABLE_moduleName___ViewState

    public init() {
    	let newState = ___VARIABLE_moduleName___ViewState()
    	state = newState
    }
}