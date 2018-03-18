//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation
import IDMFoundation
import IDMCore

typealias ___VARIABLE_moduleName___BaseService<T: DataProviderProtocol> = MagicalIntegrator<T, ___VARIABLE_moduleName___ResponseModel> where T.ParameterType == ___VARIABLE_moduleName___RequestParameter, T.DataType == Any

class ___VARIABLE_moduleName___Service: ___VARIABLE_moduleName___BaseService<___VARIABLE_moduleName___DataProvider> {
	convenience init() {
        self.init(dataProvider: ___VARIABLE_moduleName___DataProvider())
    }
}


