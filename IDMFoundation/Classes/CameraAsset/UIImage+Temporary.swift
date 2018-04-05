//
//  UIImage+Temporary.swift
//  IDMFoundation
//
//  Created by FOLY on 3/9/18.
//

import Foundation
import AVFoundation
import SiFUtilities
import UIImage_FixOrientation

extension UIImage : TemporaryProtocol {
    @objc open func saveTemporary(name: String? = nil) throws -> URL {
        let url = TemporaryUtils.temporaryURL(fileName: name, fileExtension: "png")
        
        if let image = self.fixOrientation() {
            let data = transformImageToData(image)
            do {
                try data?.write(to: url)
            }catch let e {
                let error = CommonError(title: "Can not save temporary image".localized, message: e.localizedDescription)
                throw error
            }
        } else {
            let err = CommonError(title: "Image not found".localized)
            throw err
        }
        return url
    }
    
    @objc open func transformImageToData(_ image: UIImage) -> Data? {
        return UIImagePNGRepresentation(image)
    }
}
