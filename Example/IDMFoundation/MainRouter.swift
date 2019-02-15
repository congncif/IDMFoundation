//
//  MainRouter.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMFoundation
import ModuleX
import SiFUtilities

class MainRouter: MainRouterProtocol {
    weak var sourceModule: MainModuleInterface?
    
    private var searchUserBuilder: SearchUserBuilderProtocol
    
    init(searchUserBuilder: SearchUserBuilderProtocol) {
        self.searchUserBuilder = searchUserBuilder
    }
    
    func openSearchModule(with query: String) {
        let nextModule = searchUserBuilder.build()
        nextModule.output = sourceModule
        nextModule.start(with: query)
        sourceModule?.viewController
            .navigationController?
            .pushViewController(nextModule.viewController,
                                animated: true)
    }
}
