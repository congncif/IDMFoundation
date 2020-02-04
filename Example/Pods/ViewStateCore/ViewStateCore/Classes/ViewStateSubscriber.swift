//
//  Protocols.swift
//  ViewStateCore
//
//  Created by NGUYEN CHI CONG on 2/13/19.
//

import Foundation

public protocol ViewStateSubscriber {
    func viewStateDidChange(newState: ViewState)

    // Optionals

    // Useful to show animation
    func viewStateDidChange(newState: ViewState, keyPath: String, oldValue: Any?, newValue: Any?)

    // Listening subscribing
    func viewStateDidSubscribe(_ state: ViewState)
    func viewStateWillUnsubscribe(_ state: ViewState)
}

/**********************************************************************
 /// Use ViewStateFillable if you want listen changes of each of ViewState keys then fill into a target.

 => Best practices in this case is a flat ViewState with no nested ViewState.

 class MainState: ViewState {
    @objc dynamic var name: String = "[iF] Solution"
 }

 class Subscriber: NSObject, ViewStateFillable {
    var fillingOptions: [FillingOption] {
        let nameOption = FillingOption(keyPath: #keyPath(MainState.name), target: textLabel, fillingKeyPath: #keyPath(UITextField.text))
        return [nameOption]
    }
 }
 **********************************************************************/

/// Default Keys. You can add custom FillableKey by extend FillableKey struct.
/// Eg: extension FillableKey {
///         public static let customKey = "customKey"
///     }
public struct FillableKey {
    public static let title = "title"

    public static let isHidden = "isHidden"
    public static let isEnabled = "isEnabled"

    public static let text = "text"
    public static let attributedText = "attributedText"
    public static let placeholder = "placeholder"
    public static let attributedPlaceholder = "attributedPlaceholder"

    // UIButton
    public static let currentTitle = "currentTitle"
    public static let currentImage = "currentImage"
    public static let currentAttributedTitle = "currentAttributedTitle"

    public static let tintColor = "tintColor"
    public static let textColor = "textColor"
    public static let currentTitleColor = "currentTitleColor"

    public static let image = "image"
}

public struct FillingMapper<Input, Output> {
    let mapping: (Input) -> Output

    public init(_ mapping: @escaping (Input) -> Output) {
        self.mapping = mapping
    }
}

public struct FillingOption {
    public typealias Filling<Type> = (Type?) -> Void
    public typealias Mapping = (Any?) -> Any?

    public var keyPath: String
    public var action: Filling<Any>

    public init(keyPath: String, filling: @escaping Filling<Any>) {
        self.keyPath = keyPath
        self.action = filling
    }

    public init(keyPath: String, target: NSObject,
                targetKeyPath: String, mapping: Mapping? = nil) {
        let fillingValue: (Any?) -> Void = { [weak target] value in
            guard let target = target else { return }
            if target.properties.contains(targetKeyPath) {
                var newValue = value
                if let mapping = mapping {
                    newValue = mapping(value)
                }
                target.setValue(newValue, forKeyPath: targetKeyPath)
            } else {
                assertionFailure("[ViewStateCore] The target \(target) doesn't contain \(targetKeyPath) key")
            }
        }
        self.init(keyPath: keyPath, filling: fillingValue)
    }

    public init<In, Out>(keyPath: String, target: NSObject,
                         targetKeyPath: String, mapper: FillingMapper<In, Out>? = nil) {
        self.init(keyPath: keyPath, target: target, targetKeyPath: targetKeyPath, mapping: {
            guard let input = $0 as? In else { return nil }
            return mapper?.mapping(input)
        })
    }

    public init<ValueType>(keyPath: String, mapTo valueType: ValueType.Type, filling: @escaping Filling<ValueType>) {
        let action: (Any?) -> Void = { stateValue in
            let value = stateValue as? ValueType
            filling(value)
        }
        self.init(keyPath: keyPath, filling: action)
    }
}

/// Option to Option
public typealias O2O = FillingOption

extension O2O {
    public init(_ stateKeyPath: String, _ target: NSObject,
                _ targetKeyPath: String, _ mapping: Mapping? = nil) {
        self.init(keyPath: stateKeyPath, target: target, targetKeyPath: targetKeyPath, mapping: mapping)
    }

    public init<In, Out>(_ stateKeyPath: String, _ target: NSObject,
                         _ targetKeyPath: String, _ mapper: FillingMapper<In, Out>? = nil) {
        self.init(keyPath: stateKeyPath, target: target, targetKeyPath: targetKeyPath, mapper: mapper)
    }
}

public protocol ViewStateFillable: ViewStateSubscriber {
    func fillingOptions(_ state: ViewState) -> [FillingOption]
}

/// Internal
extension ViewStateFillable {
    func fill(value: Any?, of state: ViewState, forKeyPath keyPath: String) {
        let options = fillingOptions(state)
        let targets = options.filter { $0.keyPath == keyPath }
        for item in targets {
            item.action(value)
        }
    }

    func fillValuesFromState(_ state: ViewState) {
        let workingKeys = state.workingKeys
        for key in workingKeys {
            let value = state.value(forKeyPath: key)
            fill(value: value, of: state, forKeyPath: key)
        }
    }
}

/**********************************************************************
 /// Use ViewStateRenderable if you want divide ViewState into multiples sections then listen changes of each separated section.

 => Best practices in this case is 2 level ViewState with one deep nested ViewState.

 - Delare ViewState:

 class MainViewState: ViewState {
    class QueryState: ViewState {
        @objc fileprivate(set) dynamic var query: String?
    }

    class SelectionState: ViewState {
        @objc fileprivate(set) dynamic var selectedUser: SearchUserModel?
    }

    @objc fileprivate(set) dynamic var queryState = QueryState()
    @objc fileprivate(set) dynamic var selectionState = SelectionState()
 }

 - Hanlde:

 public func render(state: ViewState) {
    if let state = state as? MainViewState.QueryState {
        searchField.text = state.query
        searchButton.isEnabled = !state.query.isNoValue
    }
    else if let state = state as? MainViewState.SelectionState {
        selectedUserLabel.text = state.selectedUser?.name
    }
 }
 **********************************************************************/

public protocol ViewStateRenderable: ViewStateSubscriber {
    func render(state: ViewState)
}

// MARK: - MutiSubscribers

public protocol ViewStateMutiSubscribing {
    func effectSubscribers(forState viewState: ViewState) -> [ViewStateSubscriber]
}

extension ViewStateSubscriber {
    public func viewStateDidChange(newState: ViewState) {
        if let multiSubs = self as? ViewStateMutiSubscribing {
            for sub in multiSubs.effectSubscribers(forState: newState) {
                sub.viewStateDidChange(newState: newState)
            }
        }

        if let renderableSub = self as? ViewStateRenderable {
            renderableSub.render(state: newState)
        }
    }

    public func viewStateDidChange(newState: ViewState, keyPath: String, oldValue: Any?, newValue: Any?) {
        if let multiSubs = self as? ViewStateMutiSubscribing {
            for sub in multiSubs.effectSubscribers(forState: newState) {
                sub.viewStateDidChange(newState: newState, keyPath: keyPath, oldValue: oldValue, newValue: newValue)
            }
        }

        if let fillableSub = self as? ViewStateFillable {
            fillableSub.fill(value: newValue, of: newState, forKeyPath: keyPath)
        }
    }

    public func viewStateDidSubscribe(_ state: ViewState) {
        if let multiSubs = self as? ViewStateMutiSubscribing {
            for sub in multiSubs.effectSubscribers(forState: state) {
                sub.viewStateDidSubscribe(state)
            }
        }

        if let renderableSub = self as? ViewStateRenderable {
            renderableSub.render(state: state)
        }

        if let fillableSub = self as? ViewStateFillable {
            fillableSub.fillValuesFromState(state)
        }
    }

    public func viewStateWillUnsubscribe(_ state: ViewState) {
        // default optional
    }
}
