//
//  CameraService.swift
//  IDMCommon
//
//  Created by NGUYEN CHI CONG on 3/28/17.
//  Copyright © 2017 [iF] Solution Co., Ltd. All rights reserved.
//

import Foundation
import MobileCoreServices
import Photos
import SiFUtilities
import UIKit

open class CameraAssetPicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    open static let shared = CameraAssetPicker()
    
    open var dismissOnFinished: Bool = true
    open var outputType: [AssetType] = [.photo]
    
    open weak var picker: UIImagePickerController?
    private var handler: ((UIImagePickerController?, CameraAsset?, Error?) -> Void)?
    
    open func showImagePicker(sourceType: UIImagePickerControllerSourceType,
                              on viewController: UIViewController? = nil,
                              dismissOnFinished: Bool = true,
                              outputType: [AssetType] = [.photo],
                              finishHandler: ((UIImagePickerController?, CameraAsset?, Error?) -> Void)? = nil) {
        handler = finishHandler
        self.dismissOnFinished = dismissOnFinished
        self.outputType = outputType
        
        if !checkPermissions(sourceType: sourceType) {
            viewController?.confirm(title: "Permission is denied".localized,
                                    message: "Go to Settings to change permissions for app".localized,
                                    cancelTitle: "Cancel".localized,
                                    cancelHandler: {},
                                    confirmedTitle: "OK".localized,
                                    confirmedHandler: {
                                        if #available(iOS 10, *) {
                                            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: nil)
                                        } else {
                                            UIApplication.shared.openURL(URL(string: UIApplicationOpenSettingsURLString)!)
                                        }
            })
            handler?(nil, nil, nil)
            return
        }
        
        guard UIImagePickerController.isSourceTypeAvailable(sourceType) else {
            let error = CommonError(title: nil, message: "Camera is not available".localized)
            handler?(nil, nil, error)
            return
        }
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        
        imagePicker.mediaTypes = self.outputType.map({ (type) -> String in
            type.key
        })
        picker = imagePicker
        viewController?.present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    open func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        var asset: CameraAsset
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            asset = CameraAsset(type: .photo, image: pickedImage)
        } else {
            let url = info[UIImagePickerControllerMediaURL] as? URL
            asset = CameraAsset(type: .video, url: url)
        }
        
        if dismissOnFinished {
            picker.dismiss(animated: true) { [weak self] in
                guard let this = self else {
                    return
                }
                this.handler?(this.picker, asset, nil)
            }
        } else {
            handler?(self.picker, asset, nil)
        }
    }
    
    open func checkPermissions(sourceType: UIImagePickerControllerSourceType) -> Bool {
        let photoPermission = PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.denied
        #if swift(>=4.0)
            let meidaType = AVMediaType.video
            let authStatus: AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: meidaType)
        #else
            let meidaType = AVMediaTypeVideo
            let authStatus: AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(forMediaType: meidaType)
        #endif
        let cameraPermission = authStatus == AVAuthorizationStatus.denied
        return sourceType == .camera ? !cameraPermission : !photoPermission
    }
}

extension CameraAssetPicker {
    func confirmShowAssetPicker(on vc: UIViewController?,
                                completion: @escaping (UIImage?, Error?) -> Void) {
        let viewController = vc
        let confirmSheet = UIAlertController(title: "", message: "Choose photo from".localized, preferredStyle: .actionSheet)
        confirmSheet.addAction(UIAlertAction(title: "Camera".localized, style: .destructive, handler: { _ in
            CameraAssetPicker.shared.showImagePicker(sourceType: .camera, on: viewController) { _, asset, error in
                completion(asset?.image, error)
            }
        }))
        
        confirmSheet.addAction(UIAlertAction(title: "Photo Library".localized, style: .default, handler: { _ in
            CameraAssetPicker.shared.showImagePicker(sourceType: .photoLibrary, on: viewController) { _, asset, error in
                completion(asset?.image, error)
            }
        }))
        
        confirmSheet.addAction(UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil))
        viewController?.present(confirmSheet, animated: true, completion: nil)
    }
}
