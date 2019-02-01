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

    public init() {
        let newState = MainViewState()
        state = newState
    }
}
