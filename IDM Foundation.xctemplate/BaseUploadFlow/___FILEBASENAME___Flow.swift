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

class ___VARIABLE_moduleName___Model: ResponseModel, ModelProtocol {
    
}

class ___VARIABLE_moduleName___ResponseModel: StandardProgressDataResponseModel<___VARIABLE_moduleName___Model>, ModelProtocol {
    
}

typealias ___VARIABLE_moduleName___BaseProvider = RootAnyProvider<UploadURLsParameter>
typealias ___VARIABLE_moduleName___Provider = BaseURLUploadProvider

class ___VARIABLE_moduleName___UploadProvider: ___VARIABLE_moduleName___Provider {
    override func requestPath(parameters: UploadURLsParameter?) -> String {
        return <#code#>
    }
}

class ___VARIABLE_moduleName___Service: MagicalIntegrator<___VARIABLE_moduleName___BaseProvider, ___VARIABLE_moduleName___ResponseModel> {
	
}

extension ___VARIABLE_moduleName___Service {
	convenience init() {
        self.init(dataProvider: ___VARIABLE_moduleName___UploadProvider())
    }
}
