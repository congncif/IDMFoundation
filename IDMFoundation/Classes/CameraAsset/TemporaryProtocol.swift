//
//  TemporaryProtocol.swift
//  
//
//  Created by NGUYEN CHI CONG on 4/7/17.
//  Copyright © 2017 [iF] Solution Co., Ltd. All rights reserved.
//

import Foundation
import AVFoundation
import SiFUtilities
import UIImage_FixOrientation

public protocol TemporaryProtocol {
    func saveTemporary() throws -> URL
}

/*********************************************************************************/
//MARK: - Extensions
/*********************************************************************************/

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
