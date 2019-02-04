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

extension ___VARIABLE_moduleName___Parameter: ParameterProtocol {}
extension ___VARIABLE_moduleName___ResponseModel: ModelProtocol {}

public typealias ___VARIABLE_moduleName___BaseProvider = AnyResultDataProvider<___VARIABLE_moduleName___Parameter>

public class ___VARIABLE_moduleName___Integrator: MagicalIntegrator<___VARIABLE_moduleName___BaseProvider, ___VARIABLE_moduleName___ResponseModel> {}
