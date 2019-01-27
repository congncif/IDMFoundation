//
//  MainBuilder.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import ModuleX
import SiFUtilities

struct MainBuilder: MainBuilderProtocol {
    func find(from source: ModuleInterface) -> MainModuleInterface? {
        guard let navigation = source.viewController.navigationController,
            let viewController = navigation.viewControllers.first(where: { $0 is MainViewController }),
            let result = viewController as? MainViewController else { return nil }
        
        return result
    }
    
    func build() -> ModuleInterface {
        let viewController = MainViewController.instantiateFromStoryboard()
        
        let router = MainRouter()
        router.sourceModule = viewController
        router.searchUserBuilder = SearchUserBuilder()
        
        let presenter = MainPresenter(router: router)
        viewController.presenter = presenter
        
        let navigation = UINavigationController(rootViewController: viewController)
        return navigation
    }
}
