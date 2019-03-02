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

class SearchUserPresenter: SearchUserPresenterProtocol {
    weak var dataLoadingMonitor: LoadingMonitorProtocol?

    let state: SearchUserViewState

    public init(state: SearchUserViewState = SearchUserViewState()) {
        self.state = state
    }
}
