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
    var router: SearchUserRouterProtocol? { get set }
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

public protocol SearchUserRouterProtocol {
    func closeSearchUserModule()
}

// Internal

// Be class to work weak reference
protocol SearchUserViewActionDelegate: class {
    func viewReady()
    func selectUser(at index: Int)
    func usersDidSelect(at index: Int)
    func refresh()
}

protocol SearchUserViewViewProtocol: ViewStateSubscriber {
    var actionDelegate: SearchUserViewActionDelegate? { get }
}

protocol SearchUserControllerProtocol {
    var presenter: SearchUserPresenterProtocol! { get }
    var integrator: SearchUserAbstractIntegrator! { get }
}

protocol SearchUserPresenterProtocol {
    var actionDelegate: SearchUserViewActionDelegate? { get }
    var errorHandler: ErrorHandlingProtocol { get }

    // define a data flow
    var dataLoadingHandler: LoadingProtocol! { get }
    var dataResponseHandler: DataProcessor<SearchUserResponseModel> { get }

    func start(with query: String)
    func currentQuery() -> String
    func setUsers(_ users: [SearchUserModel])
    func user(at index: Int) -> SearchUserModel
}


