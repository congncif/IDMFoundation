//
//  MainBuilderProtocol.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import ModuleX

public protocol MainModuleInterface: ModuleInterface {
    func selectUser(id: String)
}

public protocol MainBuilderProtocol: ModuleBuilderProtocol {
    func find(from source: ModuleInterface) -> MainModuleInterface?
}
