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

public protocol MainRouterProtocol: RouterProtocol {
    func openSearchModule(with query: String)
}

public class MainRouter: Router, MainRouterProtocol {
    var searchUserBuilder: SearchUserBuilderProtocol?
    
    public func openSearchModule(with query: String) {
        let transition = PushTransition(animator: nil, isAnimated: true)
        guard let nextModule = searchUserBuilder?.build(with: query) else { return }
        self.open(nextModule, transition: transition)
    }
}
