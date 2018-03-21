//
//  BaseDataProvider.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 1/23/17.
//  Copyright © 2017 Julian Heissl. All rights reserved.
//

import UIKit
import IDMCore
import Alamofire
import SiFUtilities

open class BaseDataProvider<T: KeyValueProtocol>: BaseProvider<T> {
    open override func request(parameters: T?,
                          completion: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        
        if let data = testResponseData(parameters: parameters) {
            completion(data.0, data.1, data.2)
            return nil
        }
        
        let request = Alamofire.request(requestPath(parameters: parameters),
                          method: httpMethod(parameters: parameters),
                          parameters: parameters?.dictionary,
                          encoding: parameterEncoding(parameters: parameters),
                          headers: headers(parameters: parameters))
            .responseJSON { [weak self] (response) in
                guard let this = self else {
                    completion(false, nil, nil)
                    return
                }
                let result = this.preprocessResponse(response)
                
                if this.logEnabled(parameters: parameters) {
                    print(result.value ?? "==> JSON Response: No value")
                }
                
                completion(result.success, result.value, result.error)
        }
        
        return {
            request.cancel()
        }
    }
}
