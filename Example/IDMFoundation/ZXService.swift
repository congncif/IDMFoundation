//
//  ZXService.swift
//  IDMFoundation
//
//  Created by FOLY on 10/28/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
import Foundation
import IDMCore
import IDMFoundation

class ZXModel: ResponseModel, ModelProtocol {
}

class ZXResponseModel: StandardProgressDataResponseModel<ZXModel>, ModelProtocol {
}

typealias ZXBaseProvider = RootAnyProvider<UploadFilesParameter>

class ZXService: MagicalIntegrator<ZXBaseProvider, ZXResponseModel> {
}

