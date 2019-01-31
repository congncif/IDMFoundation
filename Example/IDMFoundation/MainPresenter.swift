//
//  MainPresenter.swift
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

public class MainPresenter: MainPresenterProtocol {
    public private(set) var state: MainViewState
    private var router: MainRouterProtocol

    public init(router: MainRouterProtocol) {
        self.router = router

        let newState = MainViewState()
        state = newState
    }

    public func searchUser(query: String) {
        router.openSearchModule(with: query)
    }

    public func selectUser(_ user: SearchUserModel) {
        state.selectedUser = user
    }
}
