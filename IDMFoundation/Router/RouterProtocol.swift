//
//  RouterProtocol.swift
//  MyViettelPost
//
//  Created by FOLY on 11/8/18.
//  Copyright © 2018 ViettelPost. All rights reserved.
//

import Foundation

public protocol Closable: class {
    func close()
}

public protocol RouterProtocol: class {
    var sourceViewController: UIViewController? { get }
    
    func open(_ desinationViewController: UIViewController, transition: TransitionProtocol)
}
