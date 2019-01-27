//
//  NetworkProtocol.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//

import Foundation
import SiFUtilities

public protocol NetworkRequestBuilding {
    associatedtype Parameters
    
    func buildRequest(with parameters: Parameters?) throws -> URLRequest
}

public protocol NetworkRequestAdapting {
    func customRequest(_ request: URLRequest) throws -> URLRequest
}

public protocol NetworkComponentsRequestBuilding: NetworkRequestBuilding {
    func url(_ parameters: Parameters?) throws -> URL
    func method(_ parameters: Parameters?) -> String
    func headers(_ parameters: Parameters?) -> [String: String]?
    
    func adapters(_ parameters: Parameters?) -> [NetworkRequestAdapting]
}

extension NetworkComponentsRequestBuilding {
    public func buildRequest(with parameters: Parameters?) throws -> URLRequest {
        let requestUrl = try url(parameters)
        var newRequest = URLRequest(url: requestUrl)
        newRequest.httpMethod = method(parameters)
        if let headerFields = headers(parameters) {
            for (headerField, headerValue) in headerFields {
                newRequest.setValue(headerValue, forHTTPHeaderField: headerField)
            }
        }
        
        let _adapters = adapters(parameters)
        
        try _adapters.forEach {
            newRequest = try $0.customRequest(newRequest)
        }
        
        return newRequest
    }
}

public protocol NetworkRequestBuildable: NetworkComponentsRequestBuilding {
    var endpoint: EndpointProtocol { get }
    var method: String { get }
    var headers: [String: String]? { get }
    var adapters: [NetworkRequestAdapting] { get }
}

extension NetworkRequestBuildable {
    public func method(_ parameters: Parameters?) -> String {
        return method
    }
    
    public func headers(_ parameters: Parameters?) -> [String: String]? {
        return headers
    }
    
    public func adapters(_ parameters: Parameters?) -> [NetworkRequestAdapting] {
        return adapters
    }
}

public protocol NetworkRequestRouteBuildable: NetworkRequestBuildable {
    var route: NetworkRequestRoutable { get }
}

extension NetworkRequestRouteBuildable {
    public var headers: [String: String]? {
        return route.headers
    }
    
    public var method: String {
        return route.method
    }
    
    public var endpoint: EndpointProtocol {
        return route.endpoint
    }
}

public struct NetworkRequestDefaultConfiguration: NetworkRequestConfigurable {
    public var timeoutInterval: TimeInterval
    public var cachePolicy: URLRequest.CachePolicy
}

extension NetworkRequestDefaultConfiguration {
    public init() {
        self.init(timeoutInterval: 60, cachePolicy: .useProtocolCachePolicy)
    }
}

public protocol NetworkRequestable {
    var session: URLSession { get }
    var delegate: URLSessionDelegate? { get }
    var delegateQueue: OperationQueue? { get }
}

public protocol NetworkRequestRoutable {
    var headers: [String: String]? { get }
    var method: String { get }
    var endpoint: EndpointProtocol { get }
}

public protocol NetworkRequestConfigurable {
    var timeoutInterval: TimeInterval { get }
    var cachePolicy: URLRequest.CachePolicy { get }
}
