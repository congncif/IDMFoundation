//
//  SearchUserBusiness.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 2/1/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMFoundation
import ViewStateCore

extension SearchUserControllerProtocol {
    var state: SearchUserViewState {
        return presenter.state
    }
}

extension SearchUserControllerProtocol {
    func performSearch(query: String, displayer: DisplayHandlerProtocol) {
        let param = SearchUserParameter(q: query)
        searchUserIntegrator.prepareCall(parameters: param)
            .display(on: displayer)
            .dataProcessor(presenter.searchUserHandler)
            .call()
    }
}
