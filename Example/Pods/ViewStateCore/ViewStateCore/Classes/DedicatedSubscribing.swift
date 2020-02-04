//
//  ViewStateSubscribingProxy.swift
//  ViewStateCore
//
//  Created by NGUYEN CHI CONG on 7/25/19.
//

import Foundation

public protocol DedicatedViewStateSubscriber: ViewStateSubscriber {
    associatedtype State: ViewState

    func dedicatedViewStateDidChange(newState: State)
    func dedicatedViewStateDidSubscribe(_ state: State)

    func dedicatedViewStateDidChange(newState: State, keyPath: String, oldValue: Any?, newValue: Any?)
    func dedicatedViewStateWillUnsubscribe(_ state: State)
}

// Optionals
extension DedicatedViewStateSubscriber {
    public func dedicatedViewStateDidChange(newState: State, keyPath: String, oldValue: Any?, newValue: Any?) {}
    public func dedicatedViewStateWillUnsubscribe(_ state: State) {}
}

extension DedicatedViewStateSubscriber {
    public func viewStateDidChange(newState: ViewState) {
        guard let state = newState as? State else { return }
        dedicatedViewStateDidChange(newState: state)
    }

    public func viewStateDidChange(newState: ViewState, keyPath: String, oldValue: Any?, newValue: Any?) {
        guard let state = newState as? State else { return }
        dedicatedViewStateDidChange(newState: state, keyPath: keyPath, oldValue: oldValue, newValue: newValue)
    }

    public func viewStateDidSubscribe(_ state: ViewState) {
        guard let state = state as? State else { return }
        dedicatedViewStateDidSubscribe(state)
    }

    public func viewStateWillUnsubscribe(_ state: ViewState) {
        guard let state = state as? State else { return }
        dedicatedViewStateWillUnsubscribe(state)
    }
}

public protocol DedicatedViewStateFillable: ViewStateFillable {
    associatedtype State: ViewState

    func dedicatedFillingOptions(_ state: State) -> [FillingOption]
}

extension DedicatedViewStateFillable {
    public func fillingOptions(_ state: ViewState) -> [FillingOption] {
        guard let state = state as? State else { return [] }
        return dedicatedFillingOptions(state)
    }
}

public protocol DedicatedViewStateRenderable: ViewStateRenderable {
    associatedtype State: ViewState

    func dedicatedRender(state: State)
}

extension DedicatedViewStateRenderable {
    public func render(state: ViewState) {
        guard let state = state as? State else { return }
        return dedicatedRender(state: state)
    }
}
