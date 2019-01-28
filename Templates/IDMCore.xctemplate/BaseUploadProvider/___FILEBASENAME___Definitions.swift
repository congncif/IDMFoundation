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

public struct ___VARIABLE_moduleName___DataModel {}

public class ___VARIABLE_moduleName___ResponseModel: NSObject, ProgressDataModelProtocol {
	public var progress: Progress?
    public var isDelaying: Bool = false
    public var data: ___VARIABLE_moduleName___DataModel?
}

public typealias ___VARIABLE_moduleName___AbstractIntegrator = AbstractIntegrator<UploadFilesParameter, ___VARIABLE_moduleName___ResponseModel>