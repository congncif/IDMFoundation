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

class ___VARIABLE_moduleName___RequestParameter: RequestParameter {
}

class ___VARIABLE_moduleName___ResponseModel: DataResponseModel<<#___VARIABLE_moduleName___Model#>>, ModelProtocol {
}

typealias ___VARIABLE_moduleName___BaseProvider = RootAnyProvider<___VARIABLE_moduleName___RequestParameter>

class ___VARIABLE_moduleName___Service: MagicalIntegrator<___VARIABLE_moduleName___BaseProvider, ___VARIABLE_moduleName___ResponseModel> {
}