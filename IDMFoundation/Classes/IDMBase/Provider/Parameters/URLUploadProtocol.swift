//
//  URLUploadProtocol.swift
//  IDMFoundation
//
//  Created by FOLY on 3/9/18.
//

import Foundation
import SiFUtilities

public protocol StringKeyValueProtocol: KeyValueProtocol {
    var queryParameters: [String: String] {get}
}

public protocol URLUploadItemProtocol {
    var uploadUrl: URL {get}
    var uploadName: String {get}
    var fileName: String? {get}
    var mimeType: String? {get}
    
    mutating func saveTemporaryData() // change URL
    func cleanTemporaryData()
}

extension URLUploadItemProtocol {
    public func cleanTemporaryData() {
        do {
            try FileManager.default.removeItem(at: uploadUrl)
            print("Removed temporary file: \(uploadUrl.path)")
        } catch let ex {
            print("Can't delete temporary file: \(uploadUrl.path) - \(ex)")
        }
    }
}

extension StringKeyValueProtocol {
    public var queryParameters: [String: String] {
        guard let query = self.dictionary as? [String: String] else {
            return [:]
        }
        return query
    }
}
