//
//  StandardProgressResponseModel.swift
//  IDMFoundation
//
//  Created by FOLY on 3/15/18.
//

import Foundation
import ObjectMapper
import IDMCore

open class StandardProgressResponseModel: ProgressModelProtocol, ModelProtocol {
    public var progress: Progress?
    public var isDelaying: Bool = false
    
    public required init?(from data: Any?) {
        if let _progress = data as? Progress {
            progress = _progress
            isDelaying = true
        } else {
            isDelaying = false
        }
    }
}
