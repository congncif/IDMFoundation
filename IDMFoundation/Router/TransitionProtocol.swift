//
//  TransitionProtocol.swift
//  MyViettelPost
//
//  Created by FOLY on 11/8/18.
//  Copyright © 2018 ViettelPost. All rights reserved.
//

import Foundation
import UIKit

public protocol TransitionProtocol: class {
    var sourceViewController: UIViewController? { get set }
    
    func open(_ desinationViewController: UIViewController)
    func close(_ sourceViewController: UIViewController)
}
