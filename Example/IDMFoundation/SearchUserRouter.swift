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

public protocol SearchUserRouterProtocol: RouterProtocol {
    func userDidSelect(_ user: SearchUserModel)
}

public class SearchUserRouter: Router, SearchUserRouterProtocol {
    var mainBuilder: MainBuilderProtocol?
    
    public func userDidSelect(_ user: SearchUserModel) {
        guard let source = sourceModule,
            let destination = mainBuilder?.find(from: source) else { return }
        
        destination.presenter?.selectUser(user)
        source.viewController.navigationController?.popToViewController(destination.viewController,
                                                                        animated: true)
    }
}
