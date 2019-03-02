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

protocol SearchViewViewProtocol: ViewStateSubscriber {
    var actionDelegate: SearchUserViewActionDelegate? { get }
}

protocol SearchUserControllerProtocol {
    var router: SearchUserRouterProtocol! { get set }
    var presenter: SearchUserPresenterProtocol! { get set }
    var integrator: SearchUserAbstractIntegrator! { get set }
}

protocol SearchUserPresenterProtocol {
    var state: SearchUserViewState { get }

    var dataLoadingMonitor: LoadingMonitorProtocol? { get }
    var dataProcessor: DataProcessor<SearchUserResponseModel> { get }

    func start(with query: String)
    func setUsers(_ users: [SearchUserModel])
}

protocol SearchUserRouterProtocol {
    func closeSearchUserModule()
}
