//
//  UITextField+Localize.swift
//  SiFUtilities
//
//  Created by FOLY on 12/8/18.
//

import Foundation
import UIKit

@IBDesignable extension UITextField: AssociatedObject {
    @IBInspectable public var placeholderLocalizedKey: String? {
        get {
            return getStringValue(by: &RunTimeKey.localizedPlaceholderTextKey)
        }
        
        set {
            setStringValue(newValue, forRuntimeKey: &RunTimeKey.localizedPlaceholderTextKey)
        }
    }
    
    @IBInspectable public var textLocalizedKey: String? {
        get {
            return getAssociatedObject(key: &RunTimeKey.localizedTextKey)
        }
        
        set {
            if let value = newValue, !newValue.isNoValue {
                setAssociatedObject(key: &RunTimeKey.localizedTextKey, value: value)
                
                registerLocalizeUpdateNotification()
            }
        }
    }
    
    @objc open override func updateLocalize(attributes: [UInt8: String]) {
        text = attributes[.localizedTextKey]?.localized
        placeholder = attributes[.localizedPlaceholderTextKey]?.localized
    }
}
