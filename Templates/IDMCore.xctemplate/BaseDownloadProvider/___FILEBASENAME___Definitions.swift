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

public struct ___VARIABLE_moduleName___Parameter: DownloadParameterProtocol {}

public final class ___VARIABLE_moduleName___ResponseModel: NSObject, ProgressModelProtocol {
    public var progress: Progress?
    public var isDelaying: Bool = false
}

public typealias ___VARIABLE_moduleName___AbstractIntegrator = AbstractIntegrator<___VARIABLE_moduleName___Parameter, ___VARIABLE_moduleName___ResponseModel>