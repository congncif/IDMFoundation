//
//  ResponseModelConfiguration.swift
//  IDMFoundation
//
//  Created by FOLY on 3/14/18.
//

import Foundation
import ObjectMapper

public class ResponseModelConfiguration {
    private struct SerializationKeys {
        static let message = "message"
        static let status = "status"
        static let data = "data"
        static let page = "page"
    }
    
    public static let shared = ResponseModelConfiguration()
    
    private init() {
    }
    
    public var messageKey: String = SerializationKeys.message
    public var statusKey: String = SerializationKeys.status
    public var dataKey: String = SerializationKeys.data
    public var pageKey: String = SerializationKeys.page
    public var validator: ((_ model: ResponseModelProtocol) -> Error?)?
    public var extraMapping: ((_ map: Map) -> Any?)?
}

extension ResponseModelProtocol {
    public var invalidDataError: Error? {
        return ResponseModelConfiguration.shared.validator?(self)
    }
}
