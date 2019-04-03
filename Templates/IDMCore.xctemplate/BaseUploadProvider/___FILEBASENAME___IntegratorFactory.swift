//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import IDMFoundation

public struct ___VARIABLE_moduleName___IntegratorFactory {
	private init() {}
	
	public static func getIntegrator() -> ___VARIABLE_moduleName___AbstractIntegrator {
		return ___VARIABLE_moduleName___Integrator(dataProvider: ___VARIABLE_moduleName___UploadProvider(route: <#NetworkRoute#>), executingType: .only)
	}
}