//
//  MainBuilderProtocol.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import ModuleX
import ViewStateCore

public protocol MainModuleInterface: ModuleInterface, MainInputProtocol, SearchUserOutputProtocol {
    var output: MainOutputProtocol? { get set }
}

protocol MainControllerProtocol {
    var router: MainRouterProtocol? { get }

    var presenter: MainPresenterProtocol! { get }
}

protocol MainPresenterProtocol {
    var state: MainViewState { get }

    func selectUser(_ user: SearchUserModel)
    func setQuery(_ query: String?)
}

// Go out module

protocol MainRouterProtocol {
    func openSearchModule(with query: String)
}

// In/Out

public protocol MainInputProtocol {}

public protocol MainOutputProtocol: class {}
