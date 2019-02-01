//
//  MainBuilderProtocol.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import ModuleX
import ViewStateCore
import IDMCore

public protocol MainModuleInterface: ModuleInterface {
    var presenter: MainPresenterProtocol! { get }
    var router: MainRouterProtocol! { get }
}

public protocol MainPresenterProtocol {
    var state: MainViewState { get }
    
    func selectUser(_ user: SearchUserModel)
    func setQuery(_ query: String?)
}

// Go in module

public protocol MainBuilderProtocol: ModuleBuilderProtocol {
    func find(from source: ModuleInterface) -> MainModuleInterface?
}

// Go out module

public protocol MainRouterProtocol: RouterProtocol {
    func openSearchModule(with query: String)
}

