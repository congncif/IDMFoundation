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

open class BaseDownloadProvider<P>: BaseEncodeNetworkProvider<P> where P: DownloadParameterProtocol {
    open var customRequest: (DownloadRequest) -> Void
    
    public init(route: NetworkRequestRoutable,
                encoder: ParameterEncoding = URLEncoding.default,
                adapters: [NetworkRequestAdapting] = [],
                customRequest: @escaping (DownloadRequest) -> Void = { $0.validate() },
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
            
            log(url: newRequest.url, title: "🚦", data: parameters?.payload)
            
            let dataRequest = sessionManager.download(newRequest) { (_, response) -> (destinationURL: URL, options: DownloadRequest.DownloadOptions) in
                if let desUrl = parameters?.destinationUrl(suggestedFilename: response.suggestedFilename) {
                    return (desUrl, [.removePreviousFile, .createIntermediateDirectories])
                } else {
                    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                    let fileURL = documentsURL.appendingPathComponent(response.suggestedFilename ?? String.random())
                    return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
                }
            }
            
            customRequest(dataRequest)
            
            dataRequest.downloadProgress { progress in
                completion(true, progress, nil)
            }
            
            process(dataRequest, completion: completion)
            
            cancelHandler = dataRequest.cancel
        } catch let exception {
            completion(false, nil, exception)
        }
        return cancelHandler
    }
    
    open func process(_ dataRequest: DownloadRequest, completion: @escaping (Bool, Any?, Error?) -> Void) {
        dataRequest.response { response in
            let error = response.error
            
            let isSuccess = error == nil
            if isSuccess {
                log(url: response.response?.url, title: "🌸", data: response.destinationURL)
            } else {
                log(url: response.response?.url, title: "🥀", data: response.error)
            }
            
            completion(isSuccess, response, error)
        }
    }
}
