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

public struct SearchUserBuilder: SearchUserBuilderProtocol {
    public func build() -> SearchUserModuleInterface {
        let viewController = SearchUserViewController.instantiateFromStoryboard()
        
        let router = SearchUserRouter()
        router.sourceModule = viewController
        router.mainBuilder = MainBuilder()
        
        viewController.router = router
        
        let presenter = SearchUserPresenter()
        viewController.presenter = presenter
        viewController.integrator = SearchUserIntegratorFactory.getIntegrator()
        
        return viewController
    }
}
