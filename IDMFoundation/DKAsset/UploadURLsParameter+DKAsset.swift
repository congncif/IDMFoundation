//
//  UploadURLsParameter+DKAsset.swift
//  IDMFoundation
//
//  Created by FOLY on 4/25/18.
//
import DKImagePickerController
import Foundation

extension UploadURLsParameter {
    public convenience init(assets: [DKAsset], name: String = "assets") {
        let items = assets.map { asset -> DKAssetUploadItem in
            return DKAssetUploadItem(asset: asset, name: name)
        }
        self.init(items: items)
    }

    public convenience init<T: StringKeyValueProtocol>(assets: [DKAsset], name: String = "assets", query: T) {
        self.init(assets: assets, name: name)
        self.query = query
    }
}
