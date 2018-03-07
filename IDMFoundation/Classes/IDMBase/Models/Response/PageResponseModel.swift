//
//  PageDataResponse.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 7/31/17.
//  Copyright © 2017 [iF] Solution Co., Ltd. All rights reserved.
//

import Foundation
import ObjectMapper

open class PageResponseModel: ResponseModel {
    private struct SerializationKeys {
        static let page = "page"
    }
    
    open var page: Int = 0
    
    public required init?(map: Map) {
        super.init(map: map)
    }
    
    open override func mapping(map: Map) {
        super.mapping(map: map)
        
        page <- map[pageKey]
    }
    
    open var pageKey: String {
        return SerializationKeys.page
    }
}

open class PageDataResponseModel<T: Mappable>: PageResponseModel {
    private let kData = "data"
    
    open var data: [T] = []
    
    public required init?(map: Map) {
        super.init(map: map)
    }
    
    open override func mapping(map: Map) {
        super.mapping(map: map)
        data <- map[dataKey]
    }
    
    open var dataKey: String {
        return kData
    }
}
