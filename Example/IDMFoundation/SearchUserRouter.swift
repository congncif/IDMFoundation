//
//  SearchUserRouter.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMFoundation
import ModuleX

class SearchUserRouter: Router, SearchUserRouterProtocol {
    var mainBuilder: MainBuilderProtocol?
    
    func userDidSelect(_ user: SearchUserModel) {
        guard let source = sourceModule,
            let destination = mainBuilder?.findInNavigationContainer(from: source) else { return }
        
        destination.selectUser(user)
        source.viewController.navigationController?.popToViewController(destination.viewController,
                                                                        animated: true)
    }
}
