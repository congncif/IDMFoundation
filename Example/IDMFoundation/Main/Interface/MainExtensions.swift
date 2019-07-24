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

extension MainViewActionDelegate where Self: MainControllerProtocol {
    func viewReady() {
        // <#code here#>
    }

    func searchQueryDidChange(_ query: String) {
        presenter.setQuery(query)
    }
}

extension MainViewActionDelegate where Self: MainControllerProtocol, Self: MainModuleInterface {
    func search() {
        let query = presenter.currentQuery()
        router?.openSearchModule(with: query)
    }
}
