//
//  SearchUserBusiness.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 2/1/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation
import ViewStateCore

// MARK: - Actions

extension SearchUserViewActionDelegate where Self: SearchUserControllerProtocol, Self: SearchUserModuleInterface {
    func usersDidSelect(at index: Int) {
        let model = presenter.user(at: index)
        output?.userDidSelect(model)
        router?.closeSearchUserModule()
    }

    func selectUser(at index: Int) {
        let user = presenter.user(at: index)
        viewController.confirm(message: "Are you sure select user with name \(user.name.unwrapped())?") { [weak self] in
            self?.usersDidSelect(at: index)
        }
    }
}

extension SearchUserViewActionDelegate where Self: SearchUserControllerProtocol {
    func refresh() {
        performSearch()
    }

    func viewReady() {
        performSearch()
    }
}

// MARK: - Controller

extension SearchUserControllerProtocol {
    func performSearch() {
        let param = SearchUserParameter(q: presenter.currentQuery())
        integrator.prepareCall(parameters: param)
            .loadingHandler(presenter.loadingHandler)
            .errorHandler(presenter.errorHandler)
            .dataProcessor(presenter.dataProcessor)
            .call()
    }
}

// MARK: - Presenter

extension SearchUserPresenterProtocol {
    var dataProcessor: DataProcessor<SearchUserResponseModel> {
        return DataProcessor<SearchUserResponseModel>(dataProcessing: { data in
            let originItems = data?.items ?? []
            let items: [SearchUserModel] = originItems.map { item in
                let newUser = SearchUserModel()
                newUser.id = item.id?.stringValue
                newUser.name = item.login
                newUser.avatar = item.avatarUrl
                newUser.profileUrl = item.htmlUrl
                return newUser
            }
            self.setUsers(items)
        })
    }
}
