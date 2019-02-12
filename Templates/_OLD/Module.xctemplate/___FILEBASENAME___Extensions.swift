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
import ModuleX
import ViewStateCore

/*Always put every application logic in extensions of protocols*/

extension ___VARIABLE_moduleName___ControllerProtocol {
    var state: ___VARIABLE_moduleName___ViewState {
        return presenter.state
    }
}

extension ___VARIABLE_moduleName___PresenterProtocol {
    var dataProcessor: DataProcessor<___VARIABLE_moduleName___ResponseModel> {
        return DataProcessor<___VARIABLE_moduleName___ResponseModel>(dataProcessing: { data in
            // <#Process data here, cool where to convert response model to ViewState#>
        })
    }
}