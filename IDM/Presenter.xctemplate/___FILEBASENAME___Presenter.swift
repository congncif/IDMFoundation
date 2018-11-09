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

public typealias ___VARIABLE_moduleName___ModelType = ___VARIABLE_moduleName___Service.ResultType
public typealias ___VARIABLE_moduleName___DataProcessor = DataProcessor<___VARIABLE_moduleName___ModelType>

public class ___VARIABLE_moduleName___Presenter: ___VARIABLE_moduleName___PresenterProtocol {
	public private(set) var state: ___VARIABLE_moduleName___ViewState

    public private(set) var service: ___VARIABLE_moduleName___Service
    public private(set) var processor: ___VARIABLE_moduleName___DataProcessor

    public init() {
    	let newState = ___VARIABLE_moduleName___ViewState()
    	state = newState
        service = ___VARIABLE_moduleName___Service()
        processor = ___VARIABLE_moduleName___DataHandler(state: newState)
    }
}
