//
//  AAADataProvider.swift
//  IDMFoundation
//
//  Created by FOLY on 12/28/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
import Alamofire
import Foundation
import IDMCore
import IDMFoundation

public typealias AAAProvider = BaseDataProvider<AAARequestParameter>

public class AAADataProvider: AAAProvider {
    public override func requestPath(parameters: AAARequestParameter?) -> String {
        return ""
    }

    public override func httpMethod(parameters: AAARequestParameter?) -> HTTPMethod {
        return .get
    }
}
