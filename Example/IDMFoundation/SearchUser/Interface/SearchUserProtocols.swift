//
//  SearchUserBuilderProtocol.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation
import ModuleX
import ViewStateCore

public protocol SearchUserModuleInterface: ModuleInterface, SearchUserInputProtocol {
    var output: SearchUserOutputProtocol? { get set }
}

public protocol SearchUserBuilderProtocol {
    func build() -> SearchUserModuleInterface
}

// In/Out

public protocol SearchUserInputProtocol {
    func start(with query: String)
}

public protocol SearchUserOutputProtocol {
    func userDidSelect(_ user: SearchUserModel)
}

// Internal

// Be class to work weak reference
protocol SearchUserViewActionDelegate: class {
    func viewReady()
    func listItemDidSelect(at index: Int)
    func refresh()
}

protocol SearchUserViewViewProtocol: ViewStateSubscriber {
    var actionDelegate: SearchUserViewActionDelegate? { get }
}

protocol SearchUserControllerProtocol {
    var router: SearchUserRouterProtocol! { get }
    var presenter: SearchUserPresenterProtocol! { get }
    var integrator: SearchUserAbstractIntegrator! { get }
    var errorHandler: ErrorHandlingProtocol { get }
}

protocol SearchUserPresenterProtocol {
    var loadingHandler: LoadingProtocol! { get }
    var dataProcessor: DataProcessor<SearchUserResponseModel> { get }

    func register(view: SearchUserViewViewProtocol)
    func start(with query: String)
    func currentQuery() -> String
    func setUsers(_ users: [SearchUserModel])
    func user(at index: Int) -> SearchUserModel
}

protocol SearchUserRouterProtocol {
    func closeSearchUserModule()
}
