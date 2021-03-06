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

// MARK: - Controller

extension SearchUserControllerProtocol {
    func performSearch() {
        let param = SearchUserParameter(q: presenter.currentQuery())
        integrator.prepareCall(parameters: param)
            .loadingHandler(presenter.dataLoadingHandler)
            .errorHandler(presenter.errorHandler)
            .dataProcessor(presenter.dataResponseHandler)
            .call()
    }
}

// MARK: - Presenter

extension SearchUserPresenterProtocol {
    var dataResponseHandler: DataProcessor<SearchUserResponseModel> {
        return DataProcessor<SearchUserResponseModel>(dataProcessing: { data in
            let originItems = data.items ?? []
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

extension SearchUserPresenterProtocol where Self: MultipleErrorHandlingProtocol {
    var errorHandler: ErrorHandlingProtocol {
        return errorHandlingProxy
    }
}
