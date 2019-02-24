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

	public static func produce() -> ___VARIABLE_moduleName___AbstractIntegrator {
		return ___VARIABLE_moduleName___Integrator(dataProvider: ___VARIABLE_moduleName___DownloadProvider(route: <#NetworkRoute#>), executingType: .only)
	}
}