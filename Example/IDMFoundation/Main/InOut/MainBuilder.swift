//
//  MainBuilder.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 3/2/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import ModuleX
import SiFUtilities

public struct MainBuilder: MainBuilderProtocol {
    public func build() -> MainModuleInterface {
        let view = MainView.loadFromNib()

        let viewController = MainViewController(customView: view)
        viewController.title = "Main"

        let router = MainRouter()

        let presenter = MainPresenter()

        view.actionDelegate = viewController

        viewController.presenter = presenter
        viewController.router = router

        presenter.dataLoadingMonitor = viewController
        presenter.register(view: view)

        router.sourceModule = viewController
        router.searchUserBuilder = SearchUserBuilder()

        return viewController
    }
}
