//
//  BaseDataProvider.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 1/23/17.
//  Copyright © 2017 NGUYEN CHI CONG. All rights reserved.
//
import Alamofire
import IDMCore
import SiFUtilities
import UIKit

open class BaseDataProvider<P>: BaseEncodeNetworkProvider<P> where P: ParameterProtocol {
    open var customRequest: (DataRequest) -> Void
    
    public init(route: NetworkRequestRoutable,
                encoder: ParameterEncoding = URLEncoding.default,
                adapters: [NetworkRequestAdapting] = [],
                customRequest: @escaping (DataRequest) -> Void = { $0.validate() },
                sessionManager: SessionManager = .background) {
        self.customRequest = customRequest
        super.init(route: route, encoder: encoder, adapters: adapters, sessionManager: sessionManager)
    }
    
    open override func request(parameters: P?,
                               completion: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        var cancelHandler: CancelHandler?
        do {
            var newRequest = try buildRequest(with: parameters)
            newRequest = try encoder.encode(newRequest, with: parameters?.payload)
            
            log(url: newRequest.url, mark: "📦", data: parameters?.payload)
            
            let dataRequest = sessionManager.request(newRequest)
            customRequest(dataRequest)
            process(dataRequest, completion: completion)
            
            cancelHandler = dataRequest.cancel
        } catch let exception {
            completion(false, nil, exception)
        }
        return cancelHandler
    }
    
    open func process(_ dataRequest: DataRequest, completion: @escaping (Bool, Any?, Error?) -> Void) {
        dataRequest.responseJSON { response in
            let isSuccess = response.result.isSuccess
            if isSuccess {
                log(url: response.response?.url, mark: "🌸", data: response.value)
            } else {
                log(url: response.response?.url, mark: "🥀", data: response.error)
            }
            
            completion(response.result.isSuccess, response.value, response.error)
        }
    }
}
