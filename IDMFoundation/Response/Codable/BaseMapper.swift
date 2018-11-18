//
//  BaseMapper.swift
//
//
//  Created by NGUYEN CHI CONG on 11/24/16.
//  Copyright © 2016 [iF] Solution. All rights reserved.
//

import Foundation

public struct CodableError: LocalizedError {
    public static let modelCannotInitialize = CodableError(message: NSLocalizedString("Model cannot initialize", comment: ""))
    
    public var message: String
    public var failureReason: String?
    
    public init(message: String, reason: String? = nil) {
        self.message = message
        self.failureReason = reason
    }
    
    public var errorDescription: String? {
        return message
    }
}

extension Decodable {
    public init(fromData data: Any?) throws {
        guard let data = data else {
            throw CodableError.modelCannotInitialize
        }
        
        let decoder = JSONDecoder()
        var json: Data?
        
        if let pureData = data as? Data {
            json = pureData
        } else if let JSONString = data as? String, let pureData = JSONString.data(using: String.Encoding.utf8) {
            json = pureData
        } else if let JSON = data as? [String: Any], let pureData = try? JSONSerialization.data(withJSONObject: JSON) {
            json = pureData
        }
        
        if let jsonData = json {
            do {
                self = try decoder.decode(Self.self, from: jsonData)
            } catch let ex {
                throw ex
            }
        } else {
            throw CodableError.modelCannotInitialize
        }
    }
}
