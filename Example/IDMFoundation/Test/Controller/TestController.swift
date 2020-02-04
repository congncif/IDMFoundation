//
//  TestController.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 12/15/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import ViewStateCore

final class TestController: NSObject, TestControllerProtocol, TestModule, TestInputProtocol {
    // MARK: - In/Out

    private var myOutput: TestOutputProtocol?
    private var myRouter: TestRouterProtocol?

    public func connect(output: TestOutputProtocol) {
        self.myOutput = output
    }

    public func connect(router: TestRouterProtocol) {
        self.myRouter = router
    }

    var output: TestOutputProtocol? {
        guard let reference = myOutput else {
            assertionFailure("💥💥💥 Output was not set or disconnected before using.")
            return nil
        }
        return reference
    }

    var router: TestRouterProtocol? {
        guard let reference = myRouter else {
            assertionFailure("💥💥💥 Router was not set or disconnected before using.")
            return nil
        }
        return reference
    }

    // MARK: - Dependencies

    private(set) var integrator: TestAbstractIntegrator!

    private(set) var presenter: TestPresenterProtocol!

    // MARK: - Dependency Injections

    /// Internal
    func setPresenter(_ presenter: TestPresenterProtocol) {
        self.presenter = presenter
    }

    /// Public

    public func inject(integrator: TestAbstractIntegrator) {
        self.integrator = integrator
    }

    // MARK: - Input
}

// MARK: - ActionDelegate

extension TestController: TestViewActionDelegate {}
