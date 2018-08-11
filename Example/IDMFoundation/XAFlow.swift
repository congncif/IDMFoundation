//
//  XAFlow.swift
//  IDMFoundation
//
//  Created by FOLY on 8/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
import Alamofire
import Foundation
import IDMCore
import IDMFoundation

class XARequestParameter: DownloadParameterProtocol {
    var downloadPath: String?
    
    init(downloadPath: String?) {
        self.downloadPath = downloadPath
    }
}

class XAResponseModel: StandardProgressResponseModel, ModelProtocol {
    var data: DefaultDownloadResponse?
    
    public required init?(from data: Any?) {
        super.init(from: data)
        if let res = data as? DefaultDownloadResponse {
            self.data = res
        }
    }
}

typealias XABaseProvider = RootAnyProvider<XARequestParameter>
typealias XAProvider = BaseDownloadProvider<XARequestParameter>

class XADownloadProvider: XAProvider {
    override func logEnabled(parameters: XARequestParameter?) -> Bool {
        return true
    }
}

class XAService: MagicalIntegrator<XABaseProvider, XAResponseModel> {

	
}

extension XAService {
	convenience init() {
        self.init(dataProvider: XADownloadProvider())
    }
}
