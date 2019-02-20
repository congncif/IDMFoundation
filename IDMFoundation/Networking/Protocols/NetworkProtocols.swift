//
//  Protocols.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 1/30/19.
//

import Foundation
import SiFUtilities

public typealias AnyResultCompletionHandler = (Bool, Any?, Error?) -> Void

public protocol RequestAdapting {
    associatedtype RequestType

    func adapt(request: RequestType) throws -> RequestType
}

public protocol ResponseHandling {
    associatedtype RequestType

    func processRequest(_ request: RequestType, completion: @escaping AnyResultCompletionHandler)
}

public protocol Requestable {
    associatedtype RequestParameterType
    associatedtype RequestType

    func buildRequest(with parameters: RequestParameterType?) throws -> RequestType
    func buildFinalRequest(with parameters: RequestParameterType?) throws -> RequestType
    func processRequest(_ request: RequestType, completion: @escaping AnyResultCompletionHandler)
    func cancelRequest(_ request: RequestType)
}

extension Requestable {
    public func buildFinalRequest(with parameters: RequestParameterType?) throws -> RequestType {
        return try buildRequest(with: parameters)
    }
}

// #1

public protocol RequestBuildable: Requestable {
    func url(_ parameters: RequestParameterType?) throws -> URL
    func method(_ parameters: RequestParameterType?) -> String
    func headers(_ parameters: RequestParameterType?) -> [String: String]?
}

extension RequestBuildable {
    public func buildURLRequest(with parameters: RequestParameterType?) throws -> URLRequest {
        let requestUrl = try url(parameters)
        var newRequest = URLRequest(url: requestUrl)
        newRequest.httpMethod = method(parameters)
        if let headerFields = headers(parameters) {
            for (headerField, headerValue) in headerFields {
                newRequest.setValue(headerValue, forHTTPHeaderField: headerField)
            }
        }
        return newRequest
    }
}

public protocol RouteRequestBuildable: RequestBuildable {
    var route: NetworkRequestRoutable { get }
}

extension RouteRequestBuildable {
    public func method(_ parameters: RequestParameterType?) -> String {
        return route.method
    }

    public func headers(_ parameters: RequestParameterType?) -> [String: String]? {
        return route.headers
    }

    public func url(_ parameters: RequestParameterType?) throws -> URL {
        return try route.endpoint.path().toURL()
    }
}

// #2

public protocol FlexibleRequestable: Requestable {
    associatedtype RequestApdapterType: RequestAdapting where RequestApdapterType.RequestType == RequestType

    func requestAdapter(_ parameters: RequestParameterType?) -> RequestApdapterType?
}

extension FlexibleRequestable {
    public func buildAdaptiveRequest(with parameters: RequestParameterType?) throws -> RequestType {
        var newRequest = try buildRequest(with: parameters)

        if let adapter = requestAdapter(parameters) {
            newRequest = try adapter.adapt(request: newRequest)
        }

        return newRequest
    }

    public func buildFinalRequest(with parameters: RequestParameterType?) throws -> RequestType {
        return try buildAdaptiveRequest(with: parameters)
    }
}

public protocol SimpleFlexibleRequestable: FlexibleRequestable {
    var requestAdapter: RequestApdapterType? { get }
}

extension SimpleFlexibleRequestable {
    public func requestAdapter(_ parameters: RequestParameterType?) -> RequestApdapterType? {
        return requestAdapter
    }
}

public protocol HandleableRequestable: Requestable {
    associatedtype ResponseHandlerType: ResponseHandling where ResponseHandlerType.RequestType == RequestType

    var responseHandler: ResponseHandlerType { get }
}

extension HandleableRequestable {
    public func processRequest(_ request: RequestType, completion: @escaping AnyResultCompletionHandler) {
        responseHandler.processRequest(request, completion: completion)
    }
}
