//
//  MainRouter.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 3/2/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import ModuleX

class MainRouter: MainRouterProtocol {
    private weak var sourceModule: MainModuleInterface?
    private var searchUserBuilder: SearchUserBuilderProtocol?
    
    init(sourceModule: MainModuleInterface?) {
        self.sourceModule = sourceModule
    }
    
    func intendedDestination(_ searchUserBuilder: SearchUserBuilderProtocol) -> Self {
        self.searchUserBuilder = searchUserBuilder
        return self
    }
    
    private struct SearchUserOutputProxy: SearchUserOutputProtocol {
        weak var output: MainModuleInterface?
        
        func userDidSelect(_ user: SearchUserModel) {
            output?.selectUser(user)
        }
    }
    
    func openSearchModule(with query: String) {
        guard let nextModule = searchUserBuilder?.build() else { return }
        
        nextModule.router = SearchUserRouter(sourceModule: nextModule)
        nextModule.output = SearchUserOutputProxy(output: sourceModule)
        
        nextModule.start(with: query)
        
        sourceModule?.viewController
            .navigationController?
            .pushViewController(nextModule.viewController,
                                animated: true)
    }
}
