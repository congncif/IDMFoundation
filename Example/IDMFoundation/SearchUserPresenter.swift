//
//  SearchUserPresenter.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation
import ModuleX
import ViewStateCore

public protocol SearchUserPresenterProtocol {
    var state: SearchUserViewState { get }

    func start(with query: String)
    func search(loader: LoadAndErrorHandlerProtocol)
    func selectUser(id: String)
}

public class SearchUserPresenter: SearchUserPresenterProtocol {
    public var router: SearchUserRouterProtocol

    public private(set) var state: SearchUserViewState

    public var searchUserIntegrator: SearchUserAbstractIntegrator?

    public init(router: SearchUserRouterProtocol) {
        self.router = router

        let newState = SearchUserViewState()
        state = newState
    }

    public func start(with query: String) {
        state.query = query
    }

    public func search(loader: LoadAndErrorHandlerProtocol) {
        let param = SearchUserParameter(q: state.query)
        searchUserIntegrator?.prepareCall(parameters: param)
            .loader(loader)
            .onSuccess { [unowned self] model in
                let result = model?.items ?? []
                self.state.users = result.map({ (item) -> SearchUserModel in
                    let newUser = SearchUserModel()
                    newUser.id = item.id?.stringValue
                    newUser.name = item.login
                    newUser.avatar = item.avatarUrl
                    newUser.profileUrl = item.htmlUrl
                    return newUser
                })
            }
            .call()
    }

    public func selectUser(id: String) {
        router.userDidSelect(id)
    }
}
