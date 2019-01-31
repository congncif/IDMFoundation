//
//  MainViewState.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation
import ViewStateCore

public class MainViewState: ViewState {
    @objc public internal(set) dynamic var query: String?
    @objc public internal(set) dynamic var selectedUser: SearchUserModel?

    public struct Keys {
        public static var query: String {
            return #keyPath(MainViewState.query)
        }

        public static var selectedUser: String {
            return #keyPath(MainViewState.selectedUser)
        }
    }
}
