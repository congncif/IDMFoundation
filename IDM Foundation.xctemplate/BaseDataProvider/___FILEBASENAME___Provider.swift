//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation
import IDMFoundation
import Alamofire

typealias ___VARIABLE_moduleName___Provider = BaseDataProvider<___VARIABLE_moduleName___RequestParameter>

class ___VARIABLE_moduleName___DataProvider: ___VARIABLE_moduleName___Provider {
    override func requestPath(parameters: ___VARIABLE_moduleName___RequestParameter?) -> String {
        return <#code#>
    }

    override func httpMethod(parameters: ___VARIABLE_moduleName___RequestParameter?) -> HTTPMethod {
        return .post
    }
}
