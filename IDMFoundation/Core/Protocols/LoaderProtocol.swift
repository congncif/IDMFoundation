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
public protocol LoadAndErrorHandlerProtocol: LoaderProtocol, ErrorHandlerProtocol {}

extension IntegrationCall {
    @discardableResult
    public func loading(monitor: LoaderProtocol) -> Self {
        onBeginning { [weak monitor] in
            monitor?.beginLoading()
        }
        
        onCompletion { [weak monitor] in
            monitor?.finishLoading()
        }
        
        return self
    }
    
    @discardableResult
    public func error(handler: ErrorHandlerProtocol) -> Self {
        onError { [weak handler] err in
            handler?.handle(error: err)
        }
        
        return self
    }
    
    @discardableResult
    public func loader(_ handler: LoadAndErrorHandlerProtocol) -> Self {
        loading(monitor: handler).error(handler: handler)
        return self
    }
}
