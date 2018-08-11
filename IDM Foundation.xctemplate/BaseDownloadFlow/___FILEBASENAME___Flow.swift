//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//
import Alamofire
import Foundation
import IDMCore
import IDMFoundation

class ___VARIABLE_moduleName___RequestParameter: RequestParameter, DownloadParameterProtocol {
    var downloadPath: String?
    
    init(downloadPath: String?) {
        self.downloadPath = downloadPath
    }
}

class ___VARIABLE_moduleName___ResponseModel: StandardProgressResponseModel, ModelProtocol {
    var data: DefaultDownloadResponse?

    public required init?(from data: Any?) {
        super.init(from: data)
        if let res = data as? DefaultDownloadResponse {
            self.data = res
        }
    }
}

typealias ___VARIABLE_moduleName___BaseProvider = RootAnyProvider<___VARIABLE_moduleName___RequestParameter>
typealias ___VARIABLE_moduleName___Provider = BaseDownloadProvider<___VARIABLE_moduleName___RequestParameter>

class ___VARIABLE_moduleName___DownloadProvider: ___VARIABLE_moduleName___Provider {
}

class ___VARIABLE_moduleName___Service: MagicalIntegrator<___VARIABLE_moduleName___BaseProvider, ___VARIABLE_moduleName___ResponseModel> {
}

extension ___VARIABLE_moduleName___Service {
    convenience init() {
        self.init(dataProvider: ___VARIABLE_moduleName___DownloadProvider())
    }
}
