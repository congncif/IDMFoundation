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

public class ___VARIABLE_moduleName___RequestParameter: RequestParameter, DownloadParameterProtocol {
    var downloadPath: String?
    
    init(downloadPath: String?) {
        self.downloadPath = downloadPath
    }
}

public class ___VARIABLE_moduleName___ResponseModel: StandardProgressResponseModel, ModelProtocol {
    var data: DownloadResponseDataStandard?

    public required init?(from data: Any?) {
        super.init(from: data)
        if let res = data as? DownloadResponseDataStandard {
            self.data = res
        }
    }
}

public typealias ___VARIABLE_moduleName___BaseProvider = RootAnyProvider<___VARIABLE_moduleName___RequestParameter>

public class ___VARIABLE_moduleName___Integrator: MagicalIntegrator<___VARIABLE_moduleName___BaseProvider, ___VARIABLE_moduleName___ResponseModel> {
}
