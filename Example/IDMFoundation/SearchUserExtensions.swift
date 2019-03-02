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

extension SearchUserControllerProtocol {
    var state: SearchUserViewState {
        return presenter.state
    }
}

extension SearchUserControllerProtocol {
    func performSearch() {
        let param = SearchUserParameter(q: state.query.unwrapped())
        integrator.prepareCall(parameters: param)
            .setLoadingMonitor(presenter.dataLoadingMonitor)
            .dataProcessor(presenter.dataProcessor)
            .call()
    }
}

extension SearchUserViewActionDelegate where Self: SearchUserControllerProtocol, Self: SearchUserModuleInterface {
    func listItemDidSelect(at index: Int) {
        let model = state.users[index]
        output?.userDidSelect(model)
        router?.closeSearchUserModule()
    }
}

extension SearchUserViewActionDelegate where Self: SearchUserControllerProtocol {
    func refreshButtonDidTap() {
        performSearch()
    }

    func viewReady() {
        performSearch()
    }
}

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
