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
    public var page: Int = 0
    public var pageSize: Int = 24
    
    public override init() {
        super.init()
    }
    
    public init(page: Int, pageSize: Int) {
        self.page = page
        self.pageSize = pageSize
    }
}
