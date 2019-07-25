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

final class ___VARIABLE_moduleName___Presenter: ___VARIABLE_moduleName___PresenterProtocol, StatefulPresenterProtocol, MultipleErrorHandlingProtocol {
    let state: ___VARIABLE_moduleName___ViewState
    var errorHandlingProxy: ErrorHandlingProxy

    init(state: ___VARIABLE_moduleName___ViewState = ___VARIABLE_moduleName___ViewState()) {
        self.state = state
        errorHandlingProxy = ErrorHandlingProxy()
    }

    weak var actionDelegate: ___VARIABLE_moduleName___ViewActionDelegate?
    var dataLoadingHandler: LoadingProtocol!
}

extension ___VARIABLE_moduleName___Presenter {
    // <#Only change state here#>
}
