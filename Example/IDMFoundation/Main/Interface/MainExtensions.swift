//
//  MainExtensions.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 3/2/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation

/* Always put every application logic in extensions of protocols */

extension MainControllerProtocol {
    var state: MainViewState { return presenter.state }
}

extension MainViewActionDelegate where Self: MainControllerProtocol {
    func viewReady() {
        // <#code here#>
    }

    func searchQueryDidChange(_ query: String) {
        presenter.setQuery(query)
    }

    func search() {
        let query = state.currentQuery
        router?.openSearchModule(with: query)
    }
}
