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

open class BaseDataProvider<ParameterType: ParameterProtocol>: BaseProvider<ParameterType> {
    open override func request(parameters: ParameterType?,
                               completion: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        if let err = validate(parameters: parameters) {
            completion(false, nil, err)
            return nil
        }
        
        if let data = testResponseData(parameters: parameters) {
            completion(data.0, data.1, data.2)
            return nil
        }
        
        if logEnabled(parameters: parameters) {
            print("📦 Request: " + requestPath(parameters: parameters))
            let param = String(describing: parameters?.parameters)
            print("🌿 Parameters: \(param)")
        }
        
        guard let request = buildRequest(parameters: parameters) else {
            let err = CommonError(title: "Encoding Error", message: "Cannot build request")
            completion(false, nil, err)
            return nil
        }
        customRequest(request)
        request.responseJSON { [weak self] response in
            guard let this = self else {
                completion(false, nil, nil)
                return
            }
            let result = this.preprocessResponse(response)
            
            if this.logEnabled(parameters: parameters) {
                print("🌷 Response: \(String(describing: result.value))")
                if let error = result.error {
                    print("🥀 Error: " + String(describing: error))
                }
            }
            completion(result.success, result.value, result.error)
        }
        
        return {
            request.cancel()
        }
    }
    
    public lazy var sessionManager: SessionManager = {
        customSessionManager
    }()
    
    open var customSessionManager: SessionManager {
        return SessionManager.default
    }
    
    open func parameterEncoding(parameters: ParameterType?) -> ParameterEncoding {
        return URLEncoding.default
    }
    
    open var customURLRequest: ((URLRequest) -> URLRequest)? {
        return ProviderConfiguration.shared.customURLRequest
    }
    
    open func buildRequest(parameters: ParameterType?) -> DataRequest? {
        if let customUrlRequest = customURLRequest {
            var originalRequest: URLRequest?
            do {
                originalRequest = try URLRequest(url: requestPath(parameters: parameters), method: httpMethod(parameters: parameters), headers: headers(parameters: parameters))
                
                var encodedURLRequest = try parameterEncoding(parameters: parameters).encode(originalRequest!, with: parameters?.parameters)
                
                encodedURLRequest = customUrlRequest(encodedURLRequest)
                
                return sessionManager.request(encodedURLRequest)
            } catch {
                return nil
            }
        } else {
            let request = sessionManager.request(requestPath(parameters: parameters),
                                                 method: httpMethod(parameters: parameters),
                                                 parameters: parameters?.parameters,
                                                 encoding: parameterEncoding(parameters: parameters),
                                                 headers: headers(parameters: parameters))
            return request
        }
    }
}
