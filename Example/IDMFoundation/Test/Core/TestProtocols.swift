//
//  TestProtocols.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 12/15/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation
import ModuleX
import ViewStateCore

/**
 * NOTE: Convenience always comes with limitations. 
 * Using Storyboard Segue & Dependency Bridge means you are dealing with Internal Routing.
 * If you would like to strongly modularize, you should use Builder & Router instead.
 **/

/// Come from outside

public protocol TestModule: TestInputProtocol {
    func connect(output: TestOutputProtocol)
    func connect(router: TestRouterProtocol)

    func inject(integrator: TestAbstractIntegrator)
}

public protocol TestModuleInterface: ModuleInterface {
    var moduleController: TestModule { get }

    func pair(with moduleController: TestModule)
}

extension TestModuleInterface where Self: TestModule {
    public var moduleController: TestModule {
        return self
    }
}

public protocol TestBuilderProtocol {
    func build(output: TestOutputProtocol?) -> TestModuleInterface
}

extension TestBuilderProtocol {
    public func build() -> TestModuleInterface {
        return build(output: nil)
    }
}

/// In/Out

/// Declare methods come in from outside module
public protocol TestInputProtocol: AnyObject {}

/// Declare methods call back to previous module
public protocol TestOutputProtocol {}

/// Declare methods go out to next module
public protocol TestRouterProtocol {
    init(sourceModule: TestModuleInterface)

    func backToPrevious()
}

public protocol TestRouterFactoryType {
    func getRouter(sourceModule: TestModuleInterface) -> TestRouterProtocol
}

/// Internal

protocol TestViewActionDelegate: AnyObject {
    func activate()
}

protocol TestViewProtocol: ViewStateSubscriber {
    var actionDelegate: TestViewActionDelegate? { get }
}

protocol TestControllerProtocol {
    var output: TestOutputProtocol? { get }
    var router: TestRouterProtocol? { get }

    var presenter: TestPresenterProtocol! { get }
    var integrator: TestAbstractIntegrator! { get }

    /// Declare methods to work internal module
}

protocol TestPresenterProtocol {
    var actionDelegate: TestViewActionDelegate? { get }
    var errorHandler: ErrorHandlingProtocol { get }

    /// Connections
    func openConnectionToView(_ view: TestViewProtocol)

    /// Original Data

    /// Data Loading
    var dataLoadingHandler: LoadingProtocol! { get }

    var dataResponseHandler: DataProcessor<TestResponseModel> { get }

    /// State Accessibilities

    /// State Updates
}
