//
//  ZXDataProvider.swift
//  IDMFoundation
//
//  Created by FOLY on 10/28/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
import Foundation
import IDMCore
import IDMFoundation

typealias ZXProvider = BaseFileUploadProvider

class ZXUploadProvider: ZXProvider {
    override func requestPath(parameters: UploadFilesParameter?) -> String {
        return ""
    }
}
