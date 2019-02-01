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

public class MainRouter: Router, MainRouterProtocol {
    var searchUserBuilder: SearchUserBuilderProtocol?

    public func openSearchModule(with query: String) {
        guard let nextModule = searchUserBuilder?.build() else { return }
        nextModule.presenter.start(with: query)
        sourceModule?.viewController.navigationController?.pushViewController(nextModule.viewController, animated: true)
    }
}
