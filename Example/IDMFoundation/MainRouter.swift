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

class MainRouter: Router, MainRouterProtocol {
    var searchUserBuilder: SearchUserBuilderProtocol?

    func openSearchModule(with query: String) {
        guard let nextModule = searchUserBuilder?.build() else { return }
        nextModule.start(with: query)
        sourceModule?.viewController.navigationController?.pushViewController(nextModule.viewController, animated: true)
    }
}
