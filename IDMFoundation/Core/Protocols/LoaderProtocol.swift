//
//  LoaderProtocol.swift
//  IDMFoundation
//
//  Created by FOLY on 11/7/18.
//

import Foundation
import IDMCore

public protocol LoaderProtocol: AnyObject, LoadingProtocol {}
public protocol ErrorHandlerProtocol: AnyObject, ErrorHandlingProtocol {}
public protocol LoadingMonitorProtocol: LoaderProtocol, ErrorHandlerProtocol {}

extension IntegrationCall {
    @discardableResult
    public func setLoader(_ loader: LoaderProtocol?) -> Self {
        onBeginning { [weak loader] in
            loader?.beginLoading()
        }
        
        onCompletion { [weak loader] in
            loader?.finishLoading()
        }
        
        return self
    }
    
    @discardableResult
    public func setErrorHandler(_ handler: ErrorHandlerProtocol?) -> Self {
        onError { [weak handler] err in
            handler?.handle(error: err)
        }
        
        return self
    }
    
    @discardableResult
    public func setLoadingMonitor(_ monitor: LoadingMonitorProtocol?) -> Self {
        setLoader(monitor).setErrorHandler(monitor)
        return self
    }
}
