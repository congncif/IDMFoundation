//
//  TestExtensions.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 12/15/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation

/* Always put most application logics into extensions of protocol */

// MARK: - Controller

extension TestControllerProtocol {}

// MARK: - Presenter

extension TestPresenterProtocol {
    var dataResponseHandler: DataProcessor<TestResponseModel> {
        return DataProcessor<TestResponseModel>(dataProcessing: { _ in
            // <#Process data here, cool where to convert response model to ViewState#>
        })
    }
}

extension TestPresenterProtocol where Self: MultipleErrorHandlingProtocol {
    var errorHandler: ErrorHandlingProtocol {
        return errorHandlingProxy
    }
}
