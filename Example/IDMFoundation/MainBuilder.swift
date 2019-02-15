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

public protocol MainBuilderProtocol {
    func build() -> MainModuleInterface
    func findInNavigationContainer(from source: ModuleInterface) -> MainModuleInterface?
}

public struct MainBuilder: MainBuilderProtocol {
    public func findInNavigationContainer(from source: ModuleInterface) -> MainModuleInterface? {
        guard let navigation = source.viewController.navigationController,
            let viewController = navigation.viewControllers.last(where: { $0 is MainViewController }),
            let result = viewController as? MainViewController else { return nil }
        
        return result
    }
    
    public func build() -> MainModuleInterface {
        let viewController = MainViewController.instantiateFromStoryboard()
        
        let router = MainRouter(searchUserBuilder: SearchUserBuilder())
        router.sourceModule = viewController
        
        let presenter = MainPresenter()
        
        viewController.presenter = presenter
        viewController.router = router
        
        return viewController
    }
}
