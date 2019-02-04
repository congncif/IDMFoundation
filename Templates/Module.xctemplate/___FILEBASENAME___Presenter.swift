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

class ___VARIABLE_moduleName___Presenter: NSObject, ___VARIABLE_moduleName___PresenterProtocol {
	private(set) var state: ___VARIABLE_moduleName___ViewState
	var dataProcessor: DataProcessor<___VARIABLE_moduleName___ResponseModel>

    override init() {    	
    	let newState = ___VARIABLE_moduleName___ViewState()
    	state = newState
    	let _dataProcessor = ___VARIABLE_moduleName___DataProcessor()
        dataProcessor = _dataProcessor
        super.init()
        _dataProcessor.presenter = self
    }
}

class ___VARIABLE_moduleName___DataProcessor: DataProcessor<___VARIABLE_moduleName___ResponseModel> {
	weak var presenter: ___VARIABLE_moduleName___Presenter?

    override func process(data: ___VARIABLE_moduleName___ResponseModel?) {}
}