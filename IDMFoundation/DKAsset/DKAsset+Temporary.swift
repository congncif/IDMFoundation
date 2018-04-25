//
//  DKAsset+Temporary.swift
//  IDMFoundation
//
//  Created by FOLY on 4/25/18.
//
import AVFoundation
import DKImagePickerController
import Foundation
import Photos
import SiFUtilities
import UIImage_FixOrientation

/**
 * To custom asset quality before uploading, create a subclass of DKAsset then override `transformImageToData(_:)` and `videoExportPreset`
 * Eg: class SubDKAsset: DKAsset {...}
 * let subAsset = asset as? SubDKAsset ...
 */
extension DKAsset: TemporaryProtocol {
    @objc open func saveTemporary(name: String? = nil) throws -> URL {
        var url: URL
        
        if self.isVideo {
            url = TemporaryUtils.temporaryURL(fileName: name, fileExtension: "mov")
            
            let keeper = ValueKeeper<URL>(defaultValue: nil, delay: 0, timeout: DispatchTime.distantFuture) { [weak self] fullfill in
                guard let this = self else {
                    fullfill(nil)
                    return
                }
                this.writeAVToFile(url.path, presetName: this.videoExportPreset, completeBlock: { success in
                    if success {
                        fullfill(url)
                    } else {
                        fullfill(nil)
                    }
                })
            }
            
            let validUrl = keeper.syncValue
            if let result = validUrl {
                return result
            } else {
                throw CommonError(message: "Can not save video to tmp".localized)
            }
            
        } else {
            url = TemporaryUtils.temporaryURL(fileName: name, fileExtension: "png")
            let keeper = ValueKeeper<URL>(defaultValue: nil, delay: 0, timeout: DispatchTime.distantFuture) { [weak self] fullfill in
                guard let this = self else {
                    fullfill(nil)
                    return
                }
                
                this.fetchOriginalImageWithCompleteBlock({ image, _ in
                    if let image = image {
                        let data = this.transformImageToData(image)
                        do {
                            try data?.write(to: url)
                            fullfill(url)
                        } catch {
                            fullfill(nil)
                        }
                    }
                })
            }
            let validUrl = keeper.syncValue
            if let result = validUrl {
                return result
            } else {
                throw CommonError(message: "Can not save image to tmp".localized)
            }
        }
    }
    
    @objc open func transformImageToData(_ image: UIImage) -> Data? {
        return UIImagePNGRepresentation(image)
    }
    
    @objc open var videoExportPreset: String {
        return AVAssetExportPreset1920x1080
    }
}
