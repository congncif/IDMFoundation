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

        let presenter = MainPresenter()

        view.actionDelegate = viewController

        viewController.presenter = presenter

        presenter.register(view: view)

        return viewController
    }
}
