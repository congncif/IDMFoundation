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
    public func saveTemporary() throws -> URL {
        let url = TemporaryUtils.temporaryURL(fileExtension: "png")
        let data = UIImagePNGRepresentation(self.fixOrientation())
        do {
            try data?.write(to: url)
        }catch let e {
            let error = CommonError(message: e.localizedDescription)
            throw error
        }
        return url
    }
}
