//
//  UIView+Frame.swift
//  Pods-SiFUtilities_Example
//
//  Created by FOLY on 7/28/18.
//

import Foundation
import UIKit

@IBDesignable extension UIView {
    public var size: CGSize {
        get {
            return frame.size
        }
        set {
            width = newValue.width
            height = newValue.height
        }
    }
    
    /// SwifterSwift: Width of view.
    public var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    /// SwifterSwift: Height of view.
    public var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    // swiftlint:disable next identifier_name
    /// SwifterSwift: x origin of view.
    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    // swiftlint:disable next identifier_name
    /// SwifterSwift: y origin of view.
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }

}
