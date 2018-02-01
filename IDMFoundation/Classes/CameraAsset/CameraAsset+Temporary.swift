//
//  CameraAsset+Temporary.swift
//  IDMExtension
//
//  Created by FOLY on 2/1/18.
//  Copyright © 2018 [iF] Solution. All rights reserved.
//

import Foundation
import SiFUtilities

extension CameraAsset : TemporaryProtocol {
    public func saveTemporary() throws -> URL {
        var url: URL
        
        switch type {
        case .video:
            url = TemporaryUtils.temporaryURL(fileExtension: "mov")
            if let videoURL = self.url {
                do {
                    try FileManager.default.copyItem(at: videoURL, to: url)
                } catch let ex {
                    let err = CommonError(title: "Can not copy video", message: ex.localizedDescription)
                    throw err
                }
            } else {
                let err = CommonError(title: "Video URL not found")
                throw err
            }
            
        default:
            url = TemporaryUtils.temporaryURL(fileExtension: "png")
            if let image = self.image?.fixOrientation() {
                let data = UIImagePNGRepresentation(image)
                do {
                    try data?.write(to: url)
                }catch let e {
                    let error = CommonError(title: "Can not save temporary image", message: e.localizedDescription)
                    throw error
                }
            } else {
                let err = CommonError(title: "Image not found")
                throw err
            }
        }
        return url
    }
}
