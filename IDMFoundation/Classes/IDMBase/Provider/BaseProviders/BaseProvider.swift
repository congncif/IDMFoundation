//
import Alamofire
//  BaseProvider.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 8/29/17.
//  Copyright © 2017 Julian Heissl. All rights reserved.
//

import Foundation
import IDMCore
import SiFUtilities

public typealias ProviderResponseAny = (Bool, Any?, Error?)

public protocol ProviderProgressTrackingDelegate: class {
    func progressDidUpdate(progress: Double)
}

public protocol ProgressModelProtocol: DelayingCompletionProtocol {
    var progress: Progress? { get set }
}

open class RootProvider<ParameterType>: NSObject, DataProviderProtocol {
    @discardableResult
    open func request(parameters _: ParameterType?, completion _: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        fatalError("Please override \(#function) to get data")
    }
}

open class BaseProvider<T>: RootProvider<T> {
    open override func request(parameters: T?, completion: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        fatalError("You need custom \(#function) for request \(requestPath(parameters: parameters))")
    }
    
    open func requestPath(parameters: T?) -> String {
        fatalError("You need custom \(#function) for request \(requestPath(parameters: parameters))")
    }
    
    open func httpMethod(parameters: T?) -> HTTPMethod {
        return .post
    }
    
    open func parameterEncoding(parameters: T?) -> ParameterEncoding {
        return URLEncoding.default
    }
    
    open func headers(parameters: T?) -> [String: String]? {
        return ProviderConfiguration.shared.headerFields
    }
    
    open func logEnabled(parameters: T?) -> Bool {
        return false
    }
    
    open func preprocessResponse(_ response: DataResponse<Any>) -> (success: Bool, value: Any?, error: Error?) {
        let value = response.value
        let error = response.error
        let success = error == nil
        return (success, value, error)
    }
    
    open func testResponseData(parameters: T?) -> ProviderResponseAny? {
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
    
    open func testResponseFile(parameters: T?) -> String? {
        return nil
    }
}

open class BaseProviderWrapper<T: DataProviderProtocol>: RootProvider<T.ParameterType> where T.DataType == Any {
    public var provider: T?
    
    public init(provider: T?) {
        self.provider = provider
    }
    
    open override func request(parameters: T.ParameterType?, completion: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        return provider?.request(parameters: parameters, completion: completion)
    }
}

extension DataProviderProtocol where DataType == Any {
    public var wrapper: BaseProviderWrapper<Self> {
        return BaseProviderWrapper(provider: self)
    }
}

open class BaseTaskProvider<T>: BaseProvider<T> {
    open var progressTracking: ((T?, Double) -> Void)?
    open weak var progressDelegate: ProviderProgressTrackingDelegate?
    
    public override init() {
        super.init()
    }
    
    public init(delegate: ProviderProgressTrackingDelegate?) {
        progressDelegate = delegate
    }
    
    public init(trackingBlock: ((T?, Double) -> Void)?) {
        progressTracking = trackingBlock
    }
    
    open func updateProgress(parameters: T?, progress: Double) {
        progressTracking?(parameters, progress)
        progressDelegate?.progressDidUpdate(progress: progress)
    }
    
    open var trackingProgressEnabled: Bool {
        return true
    }
    
    open func buildFormData(multipart: MultipartFormData, with parameters: T?) {
        if let exData = parameters as? UploadURLsParameter {
            multipart.append(urlParameter: exData)
        } else {
            log("You need custom \(#function) for request \(requestPath(parameters: parameters))")
        }
    }
    
    open func cleanUp(parameters: T?) {
        if let exData = parameters as? UploadURLsParameter {
            try? exData.cleanUp()
        } else {
            log("You need custom \(#function) for request \(requestPath(parameters: parameters))")
        }
    }
}
