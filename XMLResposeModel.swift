//
//  XMLResposeModel.swift
//  IDMFoundation
//
//  Created by FOLY on 5/30/18.
//

import Foundation
import XMLMapper

open class XMLResponseModel: NSObject, XMLMappable {
    public var nodeName: String! //root
    
    public override init() {
        super.init()
    }

    public required init(map: XMLMap) {}

    open func mapping(map: XMLMap) {}
    
    
}
