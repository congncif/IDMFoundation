//
//  StandardProgressResponseModel.swift
//  IDMFoundation
//
//  Created by FOLY on 3/15/18.
//

import Foundation
import ObjectMapper
import IDMCore

open class StandardProgressResponseModel: ProgressModelProtocol {
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

open class StandardProgressDataResponseModel<D: ModelProtocol>: StandardProgressResponseModel where D.DataType == Any {
    public var data: D?
    
    public required init?(from data: Any?) {
        super.init(from: data)
        self.data = D(from: data)
    }
    
    open var invalidDataError: Error? {
        return data?.invalidDataError
    }
}
