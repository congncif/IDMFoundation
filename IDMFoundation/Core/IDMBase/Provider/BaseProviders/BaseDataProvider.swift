//
import Alamofire
import IDMCore
import SiFUtilities
//  BaseDataProvider.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 1/23/17.
//  Copyright © 2017 Julian Heissl. All rights reserved.
//

import UIKit

open class BaseDataProvider<ParameterType: KeyValueProtocol>: BaseProvider<ParameterType> {
    open override func request(parameters: ParameterType?,
                               completion: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        if let data = testResponseData(parameters: parameters) {
            completion(data.0, data.1, data.2)
            return nil
        }
        
        if logEnabled(parameters: parameters) {
            print("📦 Request: " + requestPath(parameters: parameters))
            let param = String(describing: parameters?.parameters)
            print("🌿 Parameters: \(param)")
        }
        
        let request = Alamofire.request(requestPath(parameters: parameters),
                                        method: httpMethod(parameters: parameters),
                                        parameters: parameters?.parameters,
                                        encoding: parameterEncoding(parameters: parameters),
                                        headers: headers(parameters: parameters))
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
    
    open func parameterEncoding(parameters: ParameterType?) -> ParameterEncoding {
        return URLEncoding.default
    }
    
    open func customRequest(_ request: DataRequest) {
        if let customClosure = ProviderConfiguration.shared.customRequest {
            customClosure(request)
        }
        if let credential = ProviderConfiguration.shared.credential {
            request.authenticate(usingCredential: credential)
        }
    }
}
