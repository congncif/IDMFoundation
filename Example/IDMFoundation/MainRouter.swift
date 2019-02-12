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

class MainRouter: Router, MainRouterProtocol {
    private var searchUserBuilder: SearchUserBuilderProtocol

    init(searchUserBuilder: SearchUserBuilderProtocol) {
        self.searchUserBuilder = searchUserBuilder
        super.init()
    }
    
    func openSearchModule(with query: String) {
        let nextModule = searchUserBuilder.build()
        nextModule.start(with: query)
        sourceModule?.viewController.navigationController?.pushViewController(nextModule.viewController, animated: true)
    }
}
