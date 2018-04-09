//
//  BaseURLUploadProvider.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 8/29/17.
//  Copyright © 2017 Julian Heissl. All rights reserved.
//

import Alamofire
import Foundation
import IDMCore
import SiFUtilities

open class BaseUploadProvider<T>: BaseTaskProvider<T> {
    private var uploader: Request?
    
    open override func request(parameters: T?,
                               completion: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        guard let parameters = parameters else {
            #if DEBUG
                log("Upload provider don't accept no-parameters")
            #endif
            completion(false, nil, nil)
            return nil
        }
        
        if let data = testResponseData(parameters: parameters) {
            completion(data.0, data.1, data.2)
            return nil
        }
        
        if let _ = uploader {
            #if DEBUG
                log("You should begin only one upload request at the same time")
            #endif
            completion(false, nil, nil)
            return nil
        }
        
        let path = requestPath(parameters: parameters)
        let method = httpMethod(parameters: parameters)
        let header = headers(parameters: parameters)
        
        Alamofire.upload(multipartFormData: { [weak self] multipart in
            self?.buildFormData(multipart: multipart, with: parameters)
        }, to: path, method: method, headers: header) { [weak self] encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                self?.customRequest(upload)
                
                upload.uploadProgress(closure: { [weak self] progress in
                    if self?.trackingProgressEnabled == true {
                        if self?.progressTracking == nil && self?.progressDelegate == nil {
                            completion(true, progress, nil)
                        } else {
                            self?.updateProgress(parameters: parameters, progress: progress.fractionCompleted)
                        }
                    }
                })
                
                upload.responseJSON { [weak self] response in
                    guard let this = self else {
                        completion(false, nil, nil)
                        return
                    }
                    
                    self?.cleanUp(parameters: parameters)
                    let result = this.preprocessResponse(response)
                    if this.logEnabled(parameters: parameters) {
                        print(result.value ?? "☞ Response: No value")
                    }
                    completion(result.success, result.value, result.error)
                    self?.uploader = nil
                }
                
                self?.uploader = upload
                
            case .failure(let encodingError):
                print(encodingError)
                completion(false, nil, encodingError)
                
                self?.uploader = nil
            }
        }
        
        return { [weak self] in
            self?.uploader?.cancel()
            self?.uploader = nil
        }
    }
    
    open func customRequest(_ request: DataRequest) {
        if let customClosure = ProviderConfiguration.shared.customRequest {
            customClosure(request)
        }
        if let credential = ProviderConfiguration.shared.credential {
            request.authenticate(usingCredential: credential)
        }
    }
    
    deinit {
        uploader?.cancel()
        uploader = nil
    }
}
