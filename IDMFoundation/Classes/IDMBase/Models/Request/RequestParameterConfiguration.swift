//
//  File.swift
//  IDMFoundation
//
//  Created by FOLY on 3/14/18.
//

import Foundation

public class RequestParameterConfiguration {
    public static let shared = RequestParameterConfiguration()
    
    private init() {
    }
    
    public var ignoreKeys: [String] = []
    public var mapKeys: [String: String] = [:]
    public var page: Int = 0
    public var pageSize: Int = 24
}
