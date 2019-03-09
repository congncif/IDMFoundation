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

class ___VARIABLE_moduleName___ViewState: ViewState {
//    <#@objc fileprivate(set) dynamic var id: String?#>
}

class ___VARIABLE_moduleName___Presenter: ___VARIABLE_moduleName___PresenterProtocol {
    var loadingHandler: LoadingProtocol!

    fileprivate let state: ___VARIABLE_moduleName___ViewState
    fileprivate var errorHandlingProxy: ErrorHandlingProxy

    init(state: ___VARIABLE_moduleName___ViewState = ___VARIABLE_moduleName___ViewState()) {
        self.state = state
        errorHandlingProxy = ErrorHandlingProxy()
    }

    var errorHandler: ErrorHandlingProtocol {
        get {
            return errorHandlingProxy
        }

        set {
            if let proxy = newValue as? ErrorHandlingProxy {
                errorHandlingProxy = proxy
            } else {
                errorHandlingProxy = ErrorHandlingProxy(handlers: [newValue])
            }
        }
    }

    func register(view: ___VARIABLE_moduleName___ViewProtocol) {
        state.register(subscriber: view)
    }
}

extension ___VARIABLE_moduleName___Presenter {
	// <#Only change state here#>
}