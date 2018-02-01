//
//  BaseProvider.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 8/29/17.
//  Copyright © 2017 Julian Heissl. All rights reserved.
//

import Foundation
import IDMCore
import Alamofire
import SiFUtilities

public protocol ProviderProgressTrackingDelegate: class {
    func progressDidUpdate(progress: Double)
}

open class BaseProvider<T>: NSObject, DataProviderProtocol {
    open func request(parameters: T?, completion: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        print("You need custom \(#function) for request \(self.requestPath(parameters: parameters))")
        fatalError()
    }
    
    open func requestPath(parameters: T?) -> String {
        print("You need custom \(#function) for request \(self.requestPath(parameters: parameters))")
        fatalError()
    }
    
    open func httpMethod(parameters: T?) -> HTTPMethod {
        return .post
    }
    
    open func parameterEncoding(parameters: T?) -> ParameterEncoding {
        return URLEncoding.default
    }
    
    open func headers(parameters: T?) -> [String: String]? {
        return [:]
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
}

open class BaseTaskProvider<T>: BaseProvider<T> {
    open var progressTracking: ((T?, Double) -> Void)? // use block if you have multiple task providers
    open weak var progressDelegate: ProviderProgressTrackingDelegate? // use delegate if you have only one task provider
    
    public init(delegate: ProviderProgressTrackingDelegate? = nil) {
        self.progressDelegate = delegate
    }
    
    public init(trackingBlock: ((T?, Double) -> Void)? = nil) {
        self.progressTracking = trackingBlock
    }
    
    open func updateProgress(parameters: T?, progress: Double) {
        progressTracking?(parameters, progress)
        progressDelegate?.progressDidUpdate(progress: progress)
    }
    
    open func buildFormData(multipart: MultipartFormData, with parameters: T?) {
        if let exData = parameters as? UploadURLsParameter {
            multipart.append(urlParameter: exData)
        } else {
            print("You need custom \(#function) for request \(self.requestPath(parameters: parameters))")
        }
    }
    
    open func cleanUp(parameters: T?) {
        if let exData = parameters as? UploadURLsParameter {
            try? exData.cleanUp()
        } else {
            print("You need custom \(#function) for request \(self.requestPath(parameters: parameters))")
        }
    }
}

