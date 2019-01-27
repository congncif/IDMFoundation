//
//  SearchUserViewState.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation
import ViewStateCore

public class SearchUserViewState: ViewState {
    @objc public internal(set) dynamic var query: String?
    @objc public internal(set) dynamic var users: [SearchUserModel] = []
}
