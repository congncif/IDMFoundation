//
//  BaseMapper.swift
//  
//
//  Created by NGUYEN CHI CONG on 11/24/16.
//  Copyright © 2016 [iF] Solution. All rights reserved.
//

import Foundation
import ObjectMapper

extension BaseMappable {
    public init?(from data: Any?) {
        guard let data = data else {
            return nil
        }
        if let JSONString = data as? String {
            if let obj: Self = Mapper(context: nil).map(JSONString: JSONString) {
                self = obj
            } else {
                return nil
            }
        } else if let JSON = data as? [String: Any] {
            if let obj: Self = Mapper(context: nil).map(JSON: JSON) {
                self = obj
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
