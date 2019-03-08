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

/*Always put every application logic in extensions of protocols*/

extension ___VARIABLE_moduleName___ControllerProtocol where Self: ErrorHandlingObjectProtocol {
    var errorHandler: ErrorHandlingProtocol { return asValueType() }
}

extension ___VARIABLE_moduleName___ViewActionDelegate where Self: ___VARIABLE_moduleName___ControllerProtocol {
    func viewReady() {
        // <#code here#>
    }
}

extension ___VARIABLE_moduleName___PresenterProtocol {
    var dataProcessor: DataProcessor<___VARIABLE_moduleName___ResponseModel> {
        return DataProcessor<___VARIABLE_moduleName___ResponseModel>(dataProcessing: { data in
            // <#Process data here, cool where to convert response model to ViewState#>
        })
    }
}