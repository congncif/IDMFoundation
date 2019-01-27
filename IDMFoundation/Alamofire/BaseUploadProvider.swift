//
//  BaseURLUploadProvider.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 8/29/17.
//  Copyright © 2017 NGUYEN CHI CONG. All rights reserved.
//

import Alamofire
import Foundation
import IDMCore
import SiFUtilities

open class BaseUploadProvider<P>: BaseNetworkProvider<P> where P: UploadFilesParameterProtocol, P: URLBuildable {
    open var encoder: (MultipartFormData, P?) -> Void
    open var customRequest: (UploadRequest) -> Void
    
    private var uploader: Request?
    
    public init(route: NetworkRequestRoutable,
                encoder: @escaping (MultipartFormData, P?) -> Void = {
                    guard let param = $1 else { return }
                    $0.append(fileParameter: param)
                },
                customRequest: @escaping (UploadRequest) -> Void = { $0.validate() },
                adapters: [NetworkRequestAdapting] = [],
                sessionManager: SessionManager = .background) {
        self.encoder = encoder
        self.customRequest = customRequest
        super.init(route: route, adapters: adapters, sessionManager: sessionManager)
    }
    
    open override func request(parameters: P?, completion: @escaping (Bool, Any?, Error?) -> Void) -> CancelHandler? {
        do {
            let newRequest = try buildRequest(with: parameters)
            
            log(url: newRequest.url, mark: "📦", data: parameters)
            
            sessionManager.upload(multipartFormData: { [weak self] in self?.encoder($0, parameters) },
                                  with: newRequest) { [weak self] encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    self?.customRequest(upload)
                    
                    upload.uploadProgress { progress in
                        completion(true, progress, nil)
                    }
                    self?.process(upload, completion: completion)
                    
                    self?.uploader = upload
                case .failure(let encodingError):
                    completion(false, nil, encodingError)
                    
                    self?.uploader = nil
                }
            }
        } catch let exception {
            completion(false, nil, exception)
        }
        
        return { [weak self] in
            self?.uploader?.cancel()
            self?.uploader = nil
        }
    }
    
    open func process(_ dataRequest: UploadRequest, completion: @escaping (Bool, Any?, Error?) -> Void) {
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
    
    deinit {
        uploader?.cancel()
        uploader = nil
    }
}
