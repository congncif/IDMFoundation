//
//  BaseProvider.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 8/29/17.
//  Copyright © 2017 NGUYEN CHI CONG. All rights reserved.
//

import Foundation
import IDMCore

public typealias ProviderResponseAny = (Bool, Any?, Error?)

// An abstract class for generic declaring
open class RootProvider<ParameterType, DataType>: NSObject, DataProviderProtocol {
    @discardableResult
    open func request(parameters _: ParameterType?, completion _: @escaping (Bool, DataType?, Error?) -> Void) -> CancelHandler? {
        fatalError("Please override \(#function) to get data")
    }
}

// An abstract class for generic declaring
open class RootAnyProvider<ParameterType>: RootProvider<ParameterType, Any> {
    @discardableResult
    open override func request(parameters _: ParameterType?, completion _: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        fatalError("Please override \(#function) to get data")
    }
}
