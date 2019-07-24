//
//  SearchUserBuilder.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation
import ModuleX
import SiFUtilities

public struct SearchUserBuilder: SearchUserBuilderProtocol {
    public func build() -> SearchUserModuleInterface {
        let customView = SearchUserView(frame: UIScreen.main.bounds)
        customView.backgroundColor = UIColor.red
        
        let viewController = SearchUserViewController(customView: customView)
        
        let navigationView = SearchUserNavigationView()
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: navigationView, action: #selector(navigationView.refreshButtonDidTap))
        navigationView.navigationItem = viewController.navigationItem
        navigationView.navigationItem.rightBarButtonItem = refreshButton
        
        var presenter = SearchUserPresenter()
        
        customView.actionDelegate = viewController
        navigationView.actionDelegate = viewController
        
        viewController.presenter = presenter
        viewController.integrator = SearchUserIntegratorFactory.getIntegrator()
        
        presenter.actionDelegate = viewController
        presenter.add(errorHandler: viewController.asErrorHandler())
        presenter.dataLoadingHandler = customView.asLoadingHandler()
        
        presenter.state.register(subscriberObject: customView)
        presenter.state.register(subscriberObject: navigationView, retain: true)
        
        return viewController
    }
}
