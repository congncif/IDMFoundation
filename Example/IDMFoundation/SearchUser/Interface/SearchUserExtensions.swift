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