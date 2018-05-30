//
//  XMLResponseModelConfiguration.swift
//  IDMFoundation
//
//  Created by FOLY on 5/30/18.
//

import Foundation
import XMLMapper

public class XMLResponseModelConfiguration {
    private struct SerializationKeys {
        static let root = "root"
        static let message = "message"
        static let status = "status"
        static let data = "data"
        static let page = "page"
    }
    
    public static let shared = XMLResponseModelConfiguration()
    
    private init() {
    }
    
    public var rootKey: String = SerializationKeys.root
    public var messageKey: String = SerializationKeys.message
    public var statusKey: String = SerializationKeys.status
//    public var dataKey: String = SerializationKeys.data
//    public var pageKey: String = SerializationKeys.page
    public var validator: ((_ model: XMLResponseModel) -> Error?)?
    public var extraMapping: ((_ map: XMLMap) -> Any?)?
}
