//
//  ModuleInterface.swift
//  IDMFoundation
//
//  Created by FOLY on 11/11/18.
//

import Foundation
import UIKit

public protocol ModuleInterface: class {
    var userInterface: UIViewController { get }
}

extension ModuleInterface where Self: UIViewController {
    public var userInterface: UIViewController {
        return self
    }
}
