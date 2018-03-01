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

class ___VARIABLE_moduleName___Service: MagicalIntegrator<___VARIABLE_moduleName___Provider, ___VARIABLE_moduleName___ResponseModel> {
    init() {
        super.init(dataProvider: ___VARIABLE_moduleName___Provider(), modelType: ___VARIABLE_moduleName___ResponseModel.self)
    }
}

