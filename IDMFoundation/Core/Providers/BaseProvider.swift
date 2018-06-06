//
//  BaseProvider.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 8/29/17.
//  Copyright © 2017 Julian Heissl. All rights reserved.
//

import Alamofire
import Foundation
import IDMCore
import SiFUtilities

public typealias ProviderResponseAny = (Bool, Any?, Error?)

open class RootProvider<ParameterType, DataType>: NSObject, DataProviderProtocol {
    @discardableResult
    open func request(parameters _: ParameterType?, completion _: @escaping (Bool, DataType?, Error?) -> Void) -> CancelHandler? {
        fatalError("Please override \(#function) to get data")
    }
}

open class RootAnyProvider<ParameterType>: RootProvider<ParameterType, Any> {
    @discardableResult
    open override func request(parameters _: ParameterType?, completion _: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        fatalError("Please override \(#function) to get data")
    }
}

open class BaseProvider<ParameterType>: RootAnyProvider<ParameterType> {
    open override func request(parameters: ParameterType?, completion: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        fatalError("You need custom \(#function) for request \(requestPath(parameters: parameters))")
    }
    
    open func requestPath(parameters: ParameterType?) -> String {
        fatalError("You need custom \(#function) for request \(requestPath(parameters: parameters))")
    }
    
    open func validate(parameters: ParameterType?) -> Error? {
        return nil
    }
    
    open func httpMethod(parameters: ParameterType?) -> HTTPMethod {
        return .post
    }
    
    open func headers(parameters: ParameterType?) -> [String: String]? {
        return ProviderConfiguration.shared.headerFields
    }
    
    open func logEnabled(parameters: ParameterType?) -> Bool {
        return false
    }
    
    open func preprocessResponse(_ response: DataResponse<Any>) -> (success: Bool, value: Any?, error: Error?) {
        let value = response.value
        let error = response.error
        let success = error == nil
        return (success, value, error)
    }
    
    open func testResponseData(parameters: ParameterType?) -> ProviderResponseAny? {
        if let filePath = testResponseFile(parameters: parameters) {
            let keeper = ValueKeeper<ProviderResponseAny>(getValueAsync: { fullfill in
                DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                    let text = try? String(contentsOfFile: filePath)
                    fullfill((true, text, nil))
                })
            })
            return keeper.syncValue
        } else {
            return nil
        }
    }
    
    open func testResponseFile(parameters: ParameterType?) -> String? {
        return nil
    }
}

open class BaseProviderWrapper<ProviderType: DataProviderProtocol>: RootAnyProvider<ProviderType.ParameterType> where ProviderType.DataType == Any {
    public var provider: ProviderType?
    
    public init(provider: ProviderType?) {
        self.provider = provider
    }
    
    open override func request(parameters: ProviderType.ParameterType?, completion: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        return provider?.request(parameters: parameters, completion: completion)
    }
}

extension DataProviderProtocol where DataType == Any {
    public var wrapper: BaseProviderWrapper<Self> {
        return BaseProviderWrapper(provider: self)
    }
}

open class BaseTaskProvider<ParameterType>: BaseProvider<ParameterType> {
    public override init() {
        super.init()
    }
    
    open var trackingProgressEnabled: Bool {
        return true
    }
    
    open func buildFormData(multipart: MultipartFormData, with parameters: ParameterType?) {
        
    }
    
    open func cleanUp(parameters: ParameterType?) {
        
    }
    
    open func saveTemporary(parameters: ParameterType?) {
        
    }
}
