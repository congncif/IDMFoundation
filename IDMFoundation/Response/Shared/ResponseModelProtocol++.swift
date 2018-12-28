//
//  ResponseModelProtocol+Validate.swift
//  IDMFoundation
//
//  Created by FOLY on 11/18/18.
//

import Foundation
import IDMCore

public protocol ProgressDataModelProtocol: ProgressModelProtocol {
    associatedtype D

    var data: D? { get set }
}

extension ModelProtocol where Self: NSObject, Self: ProgressModelProtocol, Self.DataType == Any {
    public init(fromData data: Any?) throws {
        self.init()
        if let _progress = data as? Progress {
            progress = _progress
            isDelaying = true
        } else {
            isDelaying = false
        }
    }
}

extension ModelProtocol where Self: NSObject, Self: ProgressDataModelProtocol, Self.DataType == Any, Self.D: ModelProtocol, Self.D.DataType == Any {
    public init(fromData data: Any?) throws {
        self.init()
        if let _progress = data as? Progress {
            progress = _progress
            isDelaying = true
        } else {
            isDelaying = false
            do {
                self.data = try D(fromData: data)
            } catch let ex {
                throw ex
            }
        }
    }
}

extension ModelProtocol where Self: NSObject, Self: ProgressDataModelProtocol, Self.DataType == Any {
    public init(fromData data: Any?) throws {
        self.init()
        if let _progress = data as? Progress {
            progress = _progress
            isDelaying = true
        } else {
            isDelaying = false
            if let res = data as? D {
                self.data = res
            }
        }
    }
}

extension ModelProtocol where Self: ResponseModelProtocol {
    public var invalidDataError: Error? {
        return ResponseModelConfiguration.shared.validator?(self)
    }
}
