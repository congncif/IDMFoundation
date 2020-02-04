//
//  TestRouter.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 12/15/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import ModuleX

struct TestRouter: TestRouterProtocol {
    private weak var sourceModule: TestModuleInterface?

    init(sourceModule: TestModuleInterface) {
        self.sourceModule = sourceModule
    }

    func backToPrevious() {
        sourceModule?.userInterface.backToPrevious()
    }
}

struct TestRouterFactory: TestRouterFactoryType {
	func getRouter(sourceModule: TestModuleInterface) -> TestRouterProtocol {
		let router = TestRouter(sourceModule: sourceModule)
		return router
	}
}