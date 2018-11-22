//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import IDMFoundation

public class ___VARIABLE_moduleName___RequestParameter: RequestParameter, DownloadParameterProtocol {
    var downloadPath: String?
    
    init(downloadPath: String?) {
        self.downloadPath = downloadPath
    }
}