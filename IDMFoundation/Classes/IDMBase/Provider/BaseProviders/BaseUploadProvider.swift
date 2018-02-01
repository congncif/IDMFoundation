//
//  BaseURLUploadProvider.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 8/29/17.
//  Copyright © 2017 Julian Heissl. All rights reserved.
//

import Foundation
import Alamofire
import IDMCore
import SiFUtilities

open class BaseUploadProvider<T>: BaseTaskProvider<T> {
    open override func request(parameters: T?,
                          completion: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        guard let parameters = parameters else {
            completion(false, nil, nil)
            return {}
        }
        
        let path = requestPath(parameters: parameters)
        let method = httpMethod(parameters: parameters)
        let header = headers(parameters: parameters)
        
        Alamofire.upload(multipartFormData: { [weak self] (multipart) in
            self?.buildFormData(multipart: multipart, with: parameters)
        }, to: path, method: method, headers: header) { (encodingResult) in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.uploadProgress(closure: { [weak self] (progress) in
                    self?.updateProgress(parameters: parameters, progress: progress.fractionCompleted)
                })
                
                upload.responseJSON { [weak self] response in
                    guard let this = self else {
                        completion(false, nil, nil)
                        return
                    }
                    
                    self?.cleanUp(parameters: parameters)
                    
                    let result = this.preprocessResponse(response)
                    
                    if this.logEnabled(parameters: parameters) {
                        print(result.value ?? "==> JSON Response: No value")
                    }
                    
                    completion(result.success, result.value, result.error)
                }
                
            case .failure(let encodingError):
                print(encodingError)
                completion(false, nil, encodingError)
            }
        }
        
        return {}
    }
}
