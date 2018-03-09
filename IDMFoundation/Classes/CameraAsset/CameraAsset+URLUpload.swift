//
//  CameraAsset+URLUpload.swift
//  IDMExtension
//
//  Created by FOLY on 2/1/18.
//  Copyright © 2018 [iF] Solution. All rights reserved.
//

import Foundation
import SiFUtilities

fileprivate var kURL: UInt8 = 1
extension CameraAsset: URLUploadItemProtocol, AssociatedObject {
    private var _url: URL? {
        set {
            setAssociatedObject(key: &kURL, value: newValue)
        }
        get {
            return getAssociatedObject(key: &kURL)
        }
    }
    
    public var uploadUrl: URL {
        return _url ?? URL(fileURLWithPath: "")
    }
    
    public var uploadName: String {
        return (uploadUrl.absoluteString as NSString).lastPathComponent
    }
    
    public var fileName: String? {
        return nil
    }
    
    public var mimeType: String? {
        return nil
    }
    
    public func saveTemporaryData() {
        do {
            let tmpUrl = try saveTemporary()
            _url = tmpUrl
        } catch let ex {
            fatalError(ex.localizedDescription)
        }
    }
    
    public func cleanTemporaryData() {
        do {
            try FileManager.default.removeItem(at: uploadUrl)
            print("Removed temporary file: \(uploadUrl.path)")
        } catch let ex {
            print("Can't delete temporary file: \(uploadUrl.path) - \(ex)")
        }
    }
}
