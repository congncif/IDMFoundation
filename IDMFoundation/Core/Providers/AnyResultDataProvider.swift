//
//  BaseProvider.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 8/29/17.
//  Copyright © 2017 NGUYEN CHI CONG. All rights reserved.
//

import Foundation
import IDMCore
import SiFUtilities

public typealias ProviderResponseAny = (Bool, Any?, Error?)

// An abstract class for generic declaring
public typealias AnyResultDataProvider<ParameterType> = AbstractDataProvider<ParameterType, Any>

open class ValueDataProvider<ParameterType, ValueType>: AbstractDataProvider<ParameterType, ValueType> {
    private var delay: TimeInterval
    private var valueFactory: (ParameterType?) -> IDMCore.Result<ValueType>

    public init(valueFactory: @escaping (ParameterType?) -> IDMCore.Result<ValueType>, delay: TimeInterval = 3) {
        self.valueFactory = valueFactory
        self.delay = delay
    }

    open override func request(parameters: ParameterType?, completion: @escaping (Bool, ValueType?, Error?) -> Void) -> CancelHandler? {
        let _value = valueFactory(parameters)
        let valueKeeper = ValueKeeper(defaultValue: nil, delay: delay) { fullfill in
            fullfill(_value)
        }
        if let result = valueKeeper.syncValue {
            switch result {
            case .success(let data):
                completion(true, data, nil)
            case .failure(let error):
                completion(false, nil, error)
            }
        } else {
            completion(false, nil, nil)
        }

        return nil
    }
}

open class AnyValueDataProvider<ParameterType>: ValueDataProvider<ParameterType, Any> {}

// -------------------------------------------------------------------------

@available(*, deprecated, message: "Use AnyResultDataProvider class instead")
public typealias RootAnyProvider = AnyResultDataProvider
