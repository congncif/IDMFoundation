//
//  TestBuilder.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 12/15/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import ModuleX
import SiFUtilities

public struct TestBuilder: TestBuilderProtocol {
    private let integratorFactory: TestIntegratorFactoryType
	private let routerFactory: TestRouterFactoryType?

	public init(integratorFactory: TestIntegratorFactoryType,
                routerFactory: TestRouterFactoryType? = nil) {
        self.integratorFactory = integratorFactory
        self.routerFactory = routerFactory
    }

    public func build(output: TestOutputProtocol?) -> TestModuleInterface {
        let viewController = TestViewController.instantiateFromStoryboard()

        // Inject dependencies

        viewController.moduleController.inject(integrator: integratorFactory.getIntegrator())

        if let router = routerFactory?.getRouter(sourceModule: viewController) {
            viewController.moduleController.connect(router: router)
        }

        if let delegate = output {
            viewController.moduleController.connect(output: delegate)
        }
        
        return viewController
    }
}
