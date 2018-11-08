//
//  Router.swift
//  MyViettelPost
//
//  Created by FOLY on 11/8/18.
//  Copyright © 2018 ViettelPost. All rights reserved.
//

import Foundation
import UIKit

open class Router: RouterProtocol, Closable {
    public weak var sourceViewController: UIViewController?
    public private(set) var openTransition: TransitionProtocol?
    
    public init(sourceViewController: UIViewController?) {
        self.sourceViewController = sourceViewController
    }
    
    public init() {}
    
    open func open(_ desinationViewController: UIViewController, transition: TransitionProtocol) {
        transition.sourceViewController = self.sourceViewController
        self.openTransition = transition
        transition.open(desinationViewController)
    }
    
    open func close() {
        guard let openTransition = openTransition else {
            print("Router: No transition")
            return
        }
        guard let viewController = sourceViewController else {
            print("Router: No thing to close")
            return
        }
        openTransition.close(viewController)
    }
}
