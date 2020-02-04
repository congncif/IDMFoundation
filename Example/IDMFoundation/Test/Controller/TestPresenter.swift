//
//  TestPresenter.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 12/15/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation
import ViewStateCore

/// Properties of ViewState should be protected from outside.

// MARK: - Protected State

final class TestViewState: ViewState {
//    <#@objc fileprivate(set) dynamic var id: String?#>
}

// MARK: - Presenter

final class TestPresenter: TestPresenterProtocol, StatefulPresenterProtocol, MultipleErrorHandlingProtocol {
    let state: TestViewState
    var errorHandlingProxy: ErrorHandlingProxy

    weak var actionDelegate: TestViewActionDelegate?

    var dataLoadingHandler: LoadingProtocol!

    init(state: TestViewState = TestViewState()) {
        self.state = state
        errorHandlingProxy = ErrorHandlingProxy()
    }

    func openConnectionToView(_ view: TestViewProtocol) {
        if let viewObject = view as? ViewStateSubscriberObject {
            state.register(subscriberObject: viewObject) // weak reference
        } else {
            state.register(subscriber: view)
        }
    }

    /// Original Data
}

// MARK: - Original Data

extension TestPresenter {}


// MARK: - State Accessibilities

extension TestPresenter {}

// MARK: - State Updates

extension TestPresenter {}
