//
//  ModuleBuilding.swift
//  IDMFoundation
//
//  Created by FOLY on 11/11/18.
//

import Foundation

public protocol ModuleBuilder {
    func build() -> ModuleInterface
}
