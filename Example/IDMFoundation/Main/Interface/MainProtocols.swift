//
//  MainProtocols.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 3/2/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation
import ModuleX
import ViewStateCore

/// Come from outside

public protocol MainModuleInterface: ModuleInterface, MainInputProtocol {
    var output: MainOutputProtocol? { get set }
    var router: MainRouterProtocol? { get set }
}

public protocol MainBuilderProtocol {
    func build() -> MainModuleInterface
}

/// In/Out

// Declare methods to come in from outside module
public protocol MainInputProtocol {
    func selectUser(_ user: SearchUserModel)
}

// Declare methods to call back previous module
public protocol MainOutputProtocol {}

// Declare methods to go out module
public protocol MainRouterProtocol {
    func openSearchModule(with query: String)
}

/// Internal

protocol MainViewActionDelegate: class {
    func viewReady()

    func searchQueryDidChange(_ query: String)
    func search()
}

protocol MainViewProtocol: ViewStateSubscriber {
    var actionDelegate: MainViewActionDelegate? { get }
}

protocol MainControllerProtocol {
    var presenter: MainPresenterProtocol! { get }

    // Declare methods to work internal module
}

protocol MainPresenterProtocol {
    func register(view: MainViewProtocol)

    func currentQuery() -> String
    func selectUser(_ user: SearchUserModel)
    func setQuery(_ query: String?)
}
