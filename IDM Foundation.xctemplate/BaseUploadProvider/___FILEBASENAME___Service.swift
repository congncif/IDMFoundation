//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import IDMFoundation
import IDMCore

class ___VARIABLE_moduleName___Service: MagicalIntegrator<___VARIABLE_moduleName___BaseProvider, ___VARIABLE_moduleName___ResponseModel> {
	
}

extension ___VARIABLE_moduleName___Service {
	convenience init() {
        self.init(dataProvider: ___VARIABLE_moduleName___UploadProvider())
    }
}

