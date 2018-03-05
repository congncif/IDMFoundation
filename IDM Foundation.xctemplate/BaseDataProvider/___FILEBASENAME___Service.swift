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

class ___VARIABLE_moduleName___Service: MagicalIntegrator<BaseDataProvider<___VARIABLE_moduleName___RequestParameter>, ___VARIABLE_moduleName___ResponseModel> {
    
}

extension ___VARIABLE_moduleName___Service {
	convenience init() {
        self.init(dataProvider: ___VARIABLE_moduleName___Provider(), modelType: ___VARIABLE_moduleName___ResponseModel.self)
    }
}

