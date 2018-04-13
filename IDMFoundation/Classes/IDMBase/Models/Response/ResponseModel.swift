//
//  APIResponse.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 1/23/17.
//  Copyright © 2017 [iF] Solution Co., Ltd. All rights reserved.
//

import Foundation
import IDMCore
import ObjectMapper
import SiFUtilities

open class BaseResponseModel: NSObject, Mappable {
    public override init() {
        super.init()
    }
    
    public required init?(map: Map) {}
    
    open func mapping(map: Map) {
    }
}

open class ResponseModel: BaseResponseModel {
    open var status: Int?
    open var message: String?
    open var extra: Any?
    
    public override init() {
        super.init()
    }
    
    public required init?(map: Map) {
        super.init(map: map)
    }
    
    open override func mapping(map: Map) {
        super.mapping(map: map)
        message <- map[messageKey]
        status <- map[statusKey]
        extra = extraMapping(map: map)
    }
    
    open var messageKey: String {
        return ResponseModelConfiguration.shared.messageKey
    }
    
    open var statusKey: String {
        return ResponseModelConfiguration.shared.statusKey
    }
    
    open var invalidDataError: Error? {
        return ResponseModelConfiguration.shared.validator?(self)
    }
    
    open func extraMapping(map: Map) -> Any? {
        return ResponseModelConfiguration.shared.extraMapping?(map)
    }
}

open class DataResponseModel<T: Mappable>: ResponseModel {
    open var data: T?
    
    public override init() {
        super.init()
    }
    
    public required init?(map: Map) {
        super.init(map: map)
    }
    
    open override func mapping(map: Map) {
        super.mapping(map: map)
        data <- map[dataKey]
    }
    
    open var dataKey: String {
        return ResponseModelConfiguration.shared.dataKey
    }
}
