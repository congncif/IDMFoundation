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
    public weak var defaultSourceModule: ModuleInterface?
    public private(set) var openTransition: TransitionProtocol?

    public init(sourceModule: ModuleInterface?) {
        self.defaultSourceModule = sourceModule
    }

    open func open(_ desinationModule: ModuleInterface, transition: TransitionProtocol) {
        transition.sourceViewController = self.defaultSourceModule?.userInterface
        self.openTransition = transition
        transition.open(desinationModule.userInterface)
    }

    open func close(transition: TransitionProtocol? = nil) {
        let closeTransition = transition ?? self.openTransition
        guard let activeTransition = closeTransition else {
            assertionFailure("Router: No transition")
            return
        }
        guard let viewController = self.defaultSourceModule?.userInterface else {
            assertionFailure("Router: No thing to close")
            return
        }
        activeTransition.close(viewController)
    }
}
