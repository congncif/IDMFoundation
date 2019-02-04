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

public protocol SearchUserModuleInterface: ModuleInterface {
    func start(with query: String)
}

protocol SearchUserControllerProtocol {
    var presenter: SearchUserPresenterProtocol! { get }
    var router: SearchUserRouterProtocol! { get }

    var searchUserIntegrator: SearchUserAbstractIntegrator! { get }

    func performSearch(query: String, displayer: DisplayHandlerProtocol)
}

protocol SearchUserPresenterProtocol {
    var state: SearchUserViewState { get }

    var searchUserHandler: DataProcessor<SearchUserResponseModel> { get }

    func start(with query: String)
    func setUsers(_ users: [SearchUserModel])
}

public protocol SearchUserBuilderProtocol {
    func build() -> SearchUserModuleInterface
}

protocol SearchUserRouterProtocol: RouterProtocol {
    func userDidSelect(_ user: SearchUserModel)
}
