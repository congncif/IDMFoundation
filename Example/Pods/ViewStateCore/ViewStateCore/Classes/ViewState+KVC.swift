//
//  NSObject+Properties.swift
//  ViewStateCore
//
//  Created by NGUYEN CHI CONG on 2/13/19.
//

import Foundation

public func getPropertyNames(ofClass someClass: AnyClass) -> [String] {
    var results: [String] = []
    
    var count: UInt32 = 0
    let myClass: AnyClass = someClass
    let properties = class_copyPropertyList(myClass, &count)
    
    for i in 0..<count {
        if let property = properties?[Int(i)] {
            let cname = property_getName(property)
            let name = String(cString: cname)
            results.append(name)
        }
    }
    
    free(properties)
    
    return results
}

extension NSObject {
    public var properties: [String] {
        return getPropertyNames(ofClass: classForCoder)
    }
    
    public class var properties: [String] {
        return getPropertyNames(ofClass: self)
    }
}

extension ViewState: NSCopying {
    public func copy(with zone: NSZone? = nil) -> Any {
        return makeCopy(with: zone)
    }
    
    public func makeCopy(with zone: NSZone? = nil) -> Self {
        let newState = type(of: self).init()
        
        for property in properties {
            let value = self.value(forKey: property)
            
            if let copiedValue = value as? NSCopying {
                newState.setValue(copiedValue.copy(with: zone), forKey: property)
            } else {
                #if DEBUG
                    if let someValue = value {
                        print("⚠️⚠️⚠️ \(String(describing: someValue)) do not conform NSCopying. This will perfrom a shallow copy 💗.")
                    }
                #endif
                newState.setValue(value, forKey: property)
            }
        }
        
        return newState
    }
    
    public func restoreFromState(_ viewState: ViewState, preferredCopying: Bool = true) {
        let newState = preferredCopying ? viewState.makeCopy() : viewState
        
        for property in properties {
            let value = newState.value(forKey: property)
            setValue(value, forKey: property)
        }
    }
}

extension ViewState {
    fileprivate class func initFromData<StateType>(_ data: Data) -> StateType? {
        let object = NSKeyedUnarchiver.unarchiveObject(with: data) as? StateType
        return object
    }
    
    public class func fromData(_ data: Data) -> Self? {
        return initFromData(data)
    }
    
    public func restoreFromData(_ data: Data) {
        if let object = NSKeyedUnarchiver.unarchiveObject(with: data) as? ViewState {
            restoreFromState(object)
        } else {
            #if DEBUG
                print("⚠️⚠️⚠️ Cannot restore \(String(describing: self)) from \(data)")
            #endif
        }
    }
    
    public func toData() -> Data {
        let data = NSKeyedArchiver.archivedData(withRootObject: self)
        return data
    }
}
