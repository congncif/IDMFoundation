//
//  APIResponse.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 1/23/17.
//  Copyright © 2017 [iF] Solution Co., Ltd. All rights reserved.
//

import Foundation
import ObjectMapper
import IDMCore
import SiFUtilities

open class BaseResponseModel: NSObject, Mappable, ModelProtocol {
    public override init() {
        super.init()
    }
    
    public required init?(map: Map) {}
    
    open func mapping(map: Map) {
    }
}

open class ResponseModel: BaseResponseModel {
    open var message: String?
    
    public override init() {
        super.init()
    }
    
    public required init?(map: Map) {
        super.init(map: map)
    }
    
    open override func mapping(map: Map) {
        super.mapping(map: map)
        message <- map[messageKey]
    }
    
    open var messageKey: String {
        return ResponseModelConfiguration.shared.messageKey
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
