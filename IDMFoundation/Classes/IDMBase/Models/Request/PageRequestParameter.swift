//
//  PageDataParameter.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 7/21/17.
//  Copyright © 2017 [iF] Solution Co., Ltd. All rights reserved.
//

import Foundation
import SiFUtilities

open class PageRequestParameter: RequestParameter {
    public var page: Int
    public var pageSize: Int
    
    public override init() {
        page = RequestParameterConfiguration.shared.page
        pageSize = RequestParameterConfiguration.shared.page
        super.init()
    }
    
    public init(page: Int, pageSize: Int) {
        self.page = page
        self.pageSize = pageSize
    }
    
    open var mapKeys: [String : String] {
        return RequestParameterConfiguration.shared.mapKeys
    }
}
