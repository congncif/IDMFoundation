//
//  ResponseModelConfiguration.swift
//  IDMFoundation
//
//  Created by FOLY on 3/14/18.
//

import Foundation

public class ResponseModelConfiguration {
    private struct SerializationKeys {
        static let message = "message"
        static let code = "code"
        static let data = "data"
        static let page = "page"
    }
    
    public static let shared = ResponseModelConfiguration()
    
    private init() {
    }
    
    public var messageKey: String = SerializationKeys.message
    public var codeKey: String = SerializationKeys.code
    public var dataKey: String = SerializationKeys.data
    public var pageKey: String = SerializationKeys.page
    public var validator: ((ResponseModel) -> Error?)?
}
