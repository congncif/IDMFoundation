//
//  SearchUserBuilder.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import ModuleX
import SiFUtilities

struct SearchUserBuilder: SearchUserBuilderProtocol {
    func build() -> SearchUserModuleInterface {
        let viewController = SearchUserViewController.instantiateFromStoryboard()
        
        let router = SearchUserRouter()
        router.sourceModule = viewController
        router.mainBuilder = MainBuilder()
        
        let presenter = SearchUserPresenter(router: router)
        viewController.presenter = presenter
        
        presenter.searchUserIntegrator = SearchUserIntegratorFactory.getIntegrator()
        
        return viewController
    }
}
