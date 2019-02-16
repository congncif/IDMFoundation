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

protocol SearchUserControllerProtocol {
    var router: SearchUserRouterProtocol! { get }

    var presenter: SearchUserPresenterProtocol! { get }
    var integrator: SearchUserAbstractIntegrator! { get }

    func performSearch(query: String, displayer: DisplayHandlerProtocol)
}

protocol SearchUserPresenterProtocol {
    var state: SearchUserViewState { get }

    var dataProcessor: DataProcessor<SearchUserResponseModel> { get }

    func start(with query: String)
    func setUsers(_ users: [SearchUserModel])
}

protocol SearchUserRouterProtocol {
    func closeSearchUserModule()
}
