//
//  Animator.swift
//  MyViettelPost
//
//  Created by FOLY on 11/8/18.
//  Copyright © 2018 ViettelPost. All rights reserved.
//

import Foundation
import UIKit

public protocol AnimatorProtocol: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
