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
import Alamofire

class ___VARIABLE_moduleName___RequestParameter: RequestParameter {
    
}

class ___VARIABLE_moduleName___ResponseModel: DataResponseModel<<#___VARIABLE_moduleName___Model#>>, ModelProtocol {
    
}

typealias ___VARIABLE_moduleName___BaseProvider = RootProvider<___VARIABLE_moduleName___RequestParameter>
typealias ___VARIABLE_moduleName___Provider = BaseDataProvider<___VARIABLE_moduleName___RequestParameter>

class ___VARIABLE_moduleName___DataProvider: ___VARIABLE_moduleName___Provider {
    override func requestPath(parameters: ___VARIABLE_moduleName___RequestParameter?) -> String {
        return <#code#>
    }

    override func httpMethod(parameters: ___VARIABLE_moduleName___RequestParameter?) -> HTTPMethod {
        return <#.post#>
    }
}

class ___VARIABLE_moduleName___Service: MagicalIntegrator<___VARIABLE_moduleName___BaseProvider, ___VARIABLE_moduleName___ResponseModel> {
    
}

extension ___VARIABLE_moduleName___Service {
	convenience init() {
        self.init(dataProvider: ___VARIABLE_moduleName___DataProvider())
    }
}
