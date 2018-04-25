//
//  CameraAsset+Upload.swift
//  IDMFoundation
//
//  Created by FOLY on 4/25/18.
//

import Foundation

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
            let url = try asset.saveTemporary(name: fileName)
            uploadUrl = url
        } catch let ex {
            print("Error in \(#function): \(String(describing: ex))")
        }
    }
}
