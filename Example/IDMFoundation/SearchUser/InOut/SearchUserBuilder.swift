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
        
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: customView, action: #selector(customView.refreshButtonDidTap))
        
        let viewController = SearchUserViewController(customView: customView)
        viewController.title = "Search"
        viewController.navigationItem.rightBarButtonItem = refreshButton
        
        let router = SearchUserRouter()
        
        var presenter = SearchUserPresenter()
        
        customView.actionDelegate = viewController
        
        viewController.router = router
        viewController.presenter = presenter
        viewController.integrator = SearchUserIntegratorFactory.getIntegrator()
        
        presenter.actionDelegate = viewController
        presenter.add(errorHandler: viewController.asErrorHandler())
        presenter.register(stateListener: customView)
        presenter.dataLoadingHandler = customView.asLoadingHandler()
        
        
        router.sourceModule = viewController
        
        return viewController
    }
}
