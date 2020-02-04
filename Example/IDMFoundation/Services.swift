//
//  Services.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 3/2/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

public protocol TestIntegratorFactoryType {
    func getIntegrator() -> TestAbstractIntegrator
}

public struct TestIntegratorFactory: TestIntegratorFactoryType {
    public func getIntegrator() -> TestAbstractIntegrator {
        return TestAbstractIntegrator()
    }
}

public class TestAbstractIntegrator {}

public class TestResponseModel {}
