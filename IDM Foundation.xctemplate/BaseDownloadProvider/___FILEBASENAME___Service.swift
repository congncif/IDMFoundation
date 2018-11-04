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

class ___VARIABLE_moduleName___RequestParameter: RequestParameter, DownloadParameterProtocol {
    var downloadPath: String?
    
    init(downloadPath: String?) {
        self.downloadPath = downloadPath
    }
}

class ___VARIABLE_moduleName___ResponseModel: StandardProgressResponseModel, ModelProtocol {
    var data: DownloadResponseDataStandard?

    public required init?(from data: Any?) {
        super.init(from: data)
        if let res = data as? DownloadResponseDataStandard {
            self.data = res
        }
    }
}

typealias ___VARIABLE_moduleName___BaseProvider = RootAnyProvider<___VARIABLE_moduleName___RequestParameter>

class ___VARIABLE_moduleName___Service: MagicalIntegrator<___VARIABLE_moduleName___BaseProvider, ___VARIABLE_moduleName___ResponseModel> {
}
