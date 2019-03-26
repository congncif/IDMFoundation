//
//  SearchUserInternalActions.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 3/26/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

// MARK: - Actions
extension SearchUserViewActionDelegate where Self: SearchUserControllerProtocol {
    func refresh() {
        performSearch()
    }
    
    func viewReady() {
        performSearch()
    }
}
