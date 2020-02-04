//
//  Router.swift
//  IDMFoundation
//
//  Created by FOLY on 11/8/18.
//  Copyright © 2018 [iF] Solution. All rights reserved.
//

import Foundation
import UIKit

open class Router: RouterProtocol, Closable {
    private weak var _defaultSourceModule: ModuleInterface?

    public private(set) var openTransition: TransitionProtocol?

    public init(defaultSourceModule: ModuleInterface) {
        self._defaultSourceModule = defaultSourceModule
    }

    public init() {}

    open func connectSourceModule(_ sourceModule: ModuleInterface) {
        self._defaultSourceModule = sourceModule
    }

    private var connectedSource: ModuleInterface? {
        guard let source = _defaultSourceModule else {
            assertionFailure("💥💥💥 Source module was not set or disconnected before using.")
            return nil
        }
        return source
    }

    public var defaultSourceModule: ModuleInterface? {
        return connectedSource
    }

    open func open(_ desinationModule: ModuleInterface, transition: TransitionProtocol) {
        transition.sourceViewController = self.connectedSource?.userInterface
        self.openTransition = transition
        transition.open(desinationModule.userInterface)
    }

    open func close(transition: TransitionProtocol? = nil) {
        let closeTransition = transition ?? self.openTransition
        guard let activeTransition = closeTransition else {
            assertionFailure("Router: No transition")
            return
        }
        guard let viewController = self.connectedSource?.userInterface else {
            return
        }
        activeTransition.close(viewController)
    }
}
