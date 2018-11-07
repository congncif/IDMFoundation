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

typealias ___VARIABLE_moduleName___ModelType = ___VARIABLE_moduleName___Service.ResultType
typealias ___VARIABLE_moduleName___DataProcessor = DataProcessor<___VARIABLE_moduleName___ModelType>

class ___VARIABLE_moduleName___Presenter {
    var service: ___VARIABLE_moduleName___Service
    var processor: ___VARIABLE_moduleName___DataProcessor

    init(processor: ___VARIABLE_moduleName___DataProcessor) {
        service = ___VARIABLE_moduleName___Service()
        self.processor = processor
    }
}
