//
//  NetworkExtensions.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//

import Foundation
import SiFUtilities
import Alamofire

extension URLBuildable {
    public func build(from endpoint: EndpointProtocol) throws -> URL {
        return try endpoint.path().asURL()
    }
}

extension NetworkRequestBuildable where Parameters: URLBuildable {
    public func url(_ parameters: Parameters?) throws -> URL {
        if let param = parameters {
            return try param.build(from: endpoint)
        }
        return try endpoint.path().asURL()
    }
}

public protocol AlamofireNetworkRequestable: NetworkRequestable {
    var sessionManager: SessionManager { get }
}

extension AlamofireNetworkRequestable {
    public var session: URLSession {
        return sessionManager.session
    }
    
    public var delegate: URLSessionDelegate? {
        return sessionManager.delegate
    }
    
    public var delegateQueue: OperationQueue? {
        return sessionManager.session.delegateQueue
    }
}

public protocol AlamofireNetworkRequestRoutable: NetworkRequestRoutable {
    var httpMethod: HTTPMethod { get }
}

extension AlamofireNetworkRequestRoutable {
    public var method: String {
        return httpMethod.rawValue
    }
}

public struct NetworkRoute: AlamofireNetworkRequestRoutable {
    public var endpoint: EndpointProtocol
    public var httpMethod: HTTPMethod
    public var headers: [String: String]?
    
    public init(endpoint: EndpointProtocol, method: HTTPMethod, headers: [String: String]? = nil) {
        self.endpoint = endpoint
        httpMethod = method
        self.headers = headers
    }
}
