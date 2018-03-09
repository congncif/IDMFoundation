//
//  UploadURLsParameter.swift
//
//
//  Created by NGUYEN CHI CONG on 8/29/17.
//  Copyright © 2017 Julian Heissl. All rights reserved.
//

import Foundation

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
        // Do nothing
    }
}

open class AssetUploadItem: URLUploadItemProtocol {
    open private(set) var uploadUrl: URL = URL(fileURLWithPath: "")
    open var uploadName: String = ""
    open var fileName: String?
    open var mimeType: String?
    
    open var asset: CameraAsset
    
    public init(asset: CameraAsset, name: String, fileName: String? = nil, mimeType: String? = nil) {
        self.asset = asset
        self.uploadName = name
        self.fileName = fileName
        self.mimeType = mimeType
    }
    
    open func saveTemporaryData() {
        do {
            let url = try asset.saveTemporary()
            uploadUrl = url
        } catch let ex {
            print("Error in \(#function): \(String(describing: ex))")
        }
    }
}

open class ImageUploadItem: URLUploadItemProtocol {
    open private(set) var uploadUrl: URL = URL(fileURLWithPath: "")
    open var uploadName: String = ""
    open var fileName: String?
    open var mimeType: String?
    
    open var image: UIImage
    
    public init(image: UIImage, name: String, fileName: String? = nil, mimeType: String? = nil) {
        self.image = image
        self.uploadName = name
        self.fileName = fileName
        self.mimeType = mimeType
    }
    
    open func saveTemporaryData() {
        do {
            let url = try image.saveTemporary()
            uploadUrl = url
        } catch let ex {
            print("Error in \(#function): \(String(describing: ex))")
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
        for item in self.uploadItems {
            item.cleanTemporaryData()
        }
    }
}
