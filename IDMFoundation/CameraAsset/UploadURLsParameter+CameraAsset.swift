//
//  UploadURLsParameter+CameraAsset.swift
//  IDMFoundation
//
//  Created by FOLY on 4/25/18.
//

import Foundation

extension UploadURLsParameter {
    public convenience init(assets: [CameraAsset], name: String = "assets") {
        let items = assets.map { asset -> AssetUploadItem in
            return AssetUploadItem(asset: asset, name: name)
        }
        self.init(items: items)
    }

    public convenience init<T: StringKeyValueProtocol>(assets: [CameraAsset], name: String = "assets", query: T) {
        self.init(assets: assets, name: name)
        self.query = query
    }
}
