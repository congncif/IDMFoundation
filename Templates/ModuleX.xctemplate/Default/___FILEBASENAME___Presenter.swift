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

// Properties of ViewState should be protected from outside.

final class ___VARIABLE_moduleName___ViewState: ViewState {
//    <#@objc fileprivate(set) dynamic var id: String?#>
}

final class ___VARIABLE_moduleName___Presenter: ___VARIABLE_moduleName___PresenterProtocol {
    fileprivate let state: ___VARIABLE_moduleName___ViewState
    fileprivate var errorHandlingProxy: ErrorHandlingProxy

    fileprivate weak var internalView: ___VARIABLE_moduleName___ViewProtocol?

    init(state: ___VARIABLE_moduleName___ViewState = ___VARIABLE_moduleName___ViewState()) {
        self.state = state
        errorHandlingProxy = ErrorHandlingProxy(type: .independence)
    }

    var errorHandler: ErrorHandlingProtocol {
        return errorHandlingProxy
    }

    var loadingHandler: LoadingProtocol!

    var view: ___VARIABLE_moduleName___ViewProtocol? {
        get {
            return internalView
        }

        set {
            if let oldValue = internalView {
                state.unregister(subscriber: oldValue)
            }
            if let value = newValue {
                state.register(subscriber: value)
            }
            internalView = newValue
        }
    }    
}

extension ___VARIABLE_moduleName___Presenter {
    func register(errorHandler: ErrorHandlingProtocol,
                  priority: ErrorHandlingProxy.HandlingPriority = .default,
                  where condition: ((Error?) -> Bool)? = nil) {
        errorHandlingProxy.addHandler(errorHandler, priority: priority, where: condition)
    }

    func register<ErrorType>(dedicatedErrorHandler handler: DedicatedErrorHandler<ErrorType>,
                     priority: ErrorHandlingProxy.HandlingPriority = .default,
                     where condition: ((ErrorType) -> Bool)? = nil) {
        errorHandlingProxy.addDedicatedHandler(handler, priority: priority, where: condition)
    }

    func register(view: ViewStateSubscriber) {
        state.register(subscriber: view)
    }
}

extension ___VARIABLE_moduleName___Presenter {
	// <#Only change state here#>
}