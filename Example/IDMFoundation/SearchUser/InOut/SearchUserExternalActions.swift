//
//  SearchUserActions.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 3/21/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

extension SearchUserViewActionDelegate where Self: SearchUserControllerProtocol, Self: SearchUserModuleInterface {
    func usersDidSelect(at index: Int) {
        let model = presenter.user(at: index)
        output?.userDidSelect(model)
        router?.closeSearchUserModule()
    }
    
    func selectUser(at index: Int) {
        let user = presenter.user(at: index)
        userInterface.confirm(message: "Are you sure select user with name \(user.name.unwrapped())?") { [weak self] in
            self?.usersDidSelect(at: index)
        }
    }
}
