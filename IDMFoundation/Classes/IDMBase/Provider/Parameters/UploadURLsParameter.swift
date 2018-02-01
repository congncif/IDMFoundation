//
//  UploadURLsParameter.swift
//  
//
//  Created by NGUYEN CHI CONG on 8/29/17.
//  Copyright © 2017 Julian Heissl. All rights reserved.
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
    
    func saveTemporaryData() // change URL
    func cleanTemporaryData()
}

extension StringKeyValueProtocol {
    public var queryParameters: [String: String] {
        guard let query = self.dictionary as? [String: String] else {
            return [:]
        }
        return query
    }
}

open class URLUploadItem: URLUploadItemProtocol {
    open var uploadUrl: URL
    open var uploadName: String
    open var fileName: String?
    open var mimeType: String?
    
    public init(url: URL, name: String, fileName: String? = nil, mimeType: String? = nil) {
        self.uploadUrl = url
        self.uploadName = name
        self.fileName = fileName
        self.mimeType = mimeType
    }
    
    open func saveTemporaryData() {
        //Do nothing
    }
    
    open func cleanTemporaryData() {
        do {
            try FileManager.default.removeItem(at: uploadUrl)
            print("Removed temporary file: \(uploadUrl.path)")
        } catch let ex {
            print("Can't delete temporary file: \(uploadUrl.path) - \(ex)")
        }
    }
}

open class UploadURLsParameter {
    open var uploadItems: [URLUploadItemProtocol]
    
    open var query: StringKeyValueProtocol?
    
    public init(urls: [URL]) {
        var items = [URLUploadItem]()
        for (idx, url) in urls.enumerated() {
            let item = URLUploadItem(url: url, name: "file_\(idx)")
            items.append(item)
        }
        self.uploadItems = items
    }
    
    public convenience init<T: StringKeyValueProtocol>(urls: [URL], query: T) {
        self.init(urls: urls)
        self.query = query
    }
    
    public init(items: [URLUploadItemProtocol]) {
        self.uploadItems = items
    }
    
    public init<T: StringKeyValueProtocol>(items: [URLUploadItem], query: T) {
        self.uploadItems = items
        self.query = query
    }
    
    open func cleanUp() throws {
        for item in uploadItems {
            item.cleanTemporaryData()
        }
    }
}
