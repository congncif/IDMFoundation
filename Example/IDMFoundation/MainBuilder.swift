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

public struct MainBuilder: MainBuilderProtocol {
    public func findInNavigationContainer(from source: ModuleInterface) -> MainModuleInterface? {
        guard let navigation = source.viewController.navigationController,
            let viewController = navigation.viewControllers.first(where: { $0 is MainViewController }),
            let result = viewController as? MainViewController else { return nil }
        
        return result
    }
    
    public func build() -> ModuleInterface {
        let viewController = MainViewController.instantiateFromStoryboard()
        
        let router = MainRouter()
        router.sourceModule = viewController
        router.searchUserBuilder = SearchUserBuilder()
        
        let presenter = MainPresenter()
        
        viewController.presenter = presenter
        viewController.router = router
        
        let navigation = UINavigationController(rootViewController: viewController)
        
        return navigation
    }
}
