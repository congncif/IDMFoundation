//
//  SearchUserRouter.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMFoundation
import ModuleX

class SearchUserRouter: SearchUserRouterProtocol {
    weak var sourceModule: SearchUserModuleInterface?
    
    func closeSearchUserModule() {
        sourceModule?.viewController
            .navigationController?.popViewController(animated: true)
    }
}
