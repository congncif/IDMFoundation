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

public class ___VARIABLE_moduleName___ViewState: ViewState {
    <#@objc public internal(set) dynamic var id: String?#>
}

internal class ___VARIABLE_moduleName___DataHandler: ___VARIABLE_moduleName___DataProcessor {
    internal var state: ___VARIABLE_moduleName___ViewState

    internal init(state: ___VARIABLE_moduleName___ViewState) {
        self.state = state
    }

    internal override func process(data: ___VARIABLE_moduleName___ModelType?) {
        <#Change state here#>
    }
}