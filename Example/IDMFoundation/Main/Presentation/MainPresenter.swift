//
//  MainPresenter.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 3/2/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMFoundation

class MainPresenter: MainPresenterProtocol {
    weak var dataLoadingMonitor: LoadingMonitorProtocol?

    let state: MainViewState

    public init(state: MainViewState = MainViewState()) {
        self.state = state
    }
}