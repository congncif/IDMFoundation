//
//  XMLResposeModel.swift
//  IDMFoundation
//
//  Created by FOLY on 5/30/18.
//

import Foundation
import XMLMapper

open class XMLResponseModel: NSObject, XMLMappable {
    public var nodeName: String! = XMLResponseModelConfiguration.shared.rootKey // <root>
    
    open var status: Int?
    open var message: String?
    open var extra: Any?
    
    public override init() {
        super.init()
    }
    
    public required init(map: XMLMap) {}
    
    open func mapping(map: XMLMap) {
        message <- map[messageKey]
        status <- map[statusKey]
        extra = extraMapping(map: map)
    }
    
    open var messageKey: String {
        return XMLResponseModelConfiguration.shared.messageKey
    }
    
    open var statusKey: String {
        return XMLResponseModelConfiguration.shared.statusKey
    }
    
    open func extraMapping(map: XMLMap) -> Any? {
        return XMLResponseModelConfiguration.shared.extraMapping?(map)
    }
    
    open var invalidDataError: Error? {
        return XMLResponseModelConfiguration.shared.validator?(self)
    }
}
