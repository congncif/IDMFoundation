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

public class SearchUserPresenter: NSObject, SearchUserPresenterProtocol {
    public var searchUserHandler: DataProcessor<SearchUserResponseModel>
    public private(set) var state: SearchUserViewState

    public override init() {
        state = SearchUserViewState()
        let processor = SearchUserDataProcessor()
        searchUserHandler = processor
        super.init()
        processor.presenter = self
    }
}

class SearchUserDataProcessor: DataProcessor<SearchUserResponseModel> {
    weak var presenter: SearchUserPresenter?

    override func process(data: SearchUserResponseModel?) {
        let originItems = data?.items ?? []
        let items: [SearchUserModel] = originItems.map { item in
            let newUser = SearchUserModel()
            newUser.id = item.id?.stringValue
            newUser.name = item.login
            newUser.avatar = item.avatarUrl
            newUser.profileUrl = item.htmlUrl
            return newUser
        }
        presenter?.setUsers(items)
    }
}
