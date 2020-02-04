//
//  TestExternalActions.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 12/15/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Call to outside module

/// Present alert, call to system services or other modules etc.
extension TestViewActionDelegate where Self: TestControllerProtocol {}

// MARK: - Call from outside module

extension TestInputProtocol where Self: TestControllerProtocol {}