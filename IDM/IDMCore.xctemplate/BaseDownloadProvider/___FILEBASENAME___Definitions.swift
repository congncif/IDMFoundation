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

public class ___VARIABLE_moduleName___RequestParameter: DownloadParameterProtocol {
    public var downloadPath: String?
    
    public init(downloadPath: String?) {
        self.downloadPath = downloadPath
    }
}

public class ___VARIABLE_moduleName___ResponseModel: NSObject, ProgressDataModelProtocol {
    public var progress: Progress?
    public var isDelaying: Bool = false
    public var data: DownloadResponseDataStandard?
}

public typealias ___VARIABLE_moduleName___AbstractIntegrator = AbstractIntegrator<___VARIABLE_moduleName___RequestParameter, ___VARIABLE_moduleName___ResponseModel>