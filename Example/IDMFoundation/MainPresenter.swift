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
import ViewStateCore

public protocol MainPresenterProtocol {
	var state: MainViewState { get }
    
    func searchUser(query: String)
    func selectUser(id: String)
}

public class MainPresenter: MainPresenterProtocol {
	public var router: MainRouterProtocol

	public private(set) var state: MainViewState

    public init(router: MainRouterProtocol) {
    	self.router = router
    	
    	let newState = MainViewState()
    	state = newState
    }
    
    public func searchUser(query: String) {
        router.openSearchModule(with: query)
    }
    
    public func selectUser(id: String) {
        state.selectedUser = id
    }
}
