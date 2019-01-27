//
//  BaseProvider.swift
//  IDMFoundation
//
//  Created by FOLY on 7/21/18.
//
import Alamofire
import Foundation
import IDMCore
import SiFUtilities

open class BaseNetworkProvider<P>: AnyResultDataProvider<P>, NetworkRequestRouteBuildable, AlamofireNetworkRequestable where P: URLBuildable {
    public typealias Parameters = P
    public typealias ParameterType = P
    
    open var adapters: [NetworkRequestAdapting]
    open var route: NetworkRequestRoutable
    
    open var sessionManager: SessionManager
    
    public init(route: NetworkRequestRoutable,
                adapters: [NetworkRequestAdapting],
                sessionManager: SessionManager) {
        self.route = route
        self.adapters = adapters
        self.sessionManager = sessionManager
    }
}

open class BaseEncodeNetworkProvider<P>: BaseNetworkProvider<P> where P: URLBuildable {
    open var encoder: ParameterEncoding
    
    public init(route: NetworkRequestRoutable,
                encoder: ParameterEncoding = URLEncoding.default,
                adapters: [NetworkRequestAdapting] = [],
                sessionManager: SessionManager = .background) {
        self.encoder = encoder
        super.init(route: route, adapters: adapters, sessionManager: sessionManager)
    }
}
