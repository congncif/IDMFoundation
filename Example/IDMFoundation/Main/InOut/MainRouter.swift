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
    private var testBuilder: TestBuilderProtocol!
    
    init(sourceModule: MainModuleInterface?) {
        self.sourceModule = sourceModule
    }
    
    func intendedDestination(searchUserBuilder: SearchUserBuilderProtocol) -> Self {
        self.searchUserBuilder = searchUserBuilder
        return self
    }
    
    func intendedDestination(testBuilder: TestBuilderProtocol) -> Self {
        self.testBuilder = testBuilder
        return self
    }
    
    private struct SearchUserOutputApdapter: SearchUserOutputProtocol {
        weak var output: MainModuleInterface?
        
        func userDidSelect(_ user: SearchUserModel) {
            output?.selectUser(user)
        }
    }
    
    func openSearchModule(with query: String) {
//        guard let nextModule = searchUserBuilder?.build() else { return }
//
//        nextModule.router = SearchUserRouter(sourceModule: nextModule)
//        nextModule.output = SearchUserOutputProxy(output: sourceModule)
//
//        nextModule.start(with: query)
//
//        sourceModule?.userInterface
//            .navigationController?
//            .pushViewController(nextModule.userInterface,
//                                animated: true)
        
        let nextModule = testBuilder.build()
        sourceModule?.pushModule(nextModule)
    }
}
