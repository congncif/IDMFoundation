//
//  UIViewController+Module.swift
//  ModuleX
//
//  Created by NGUYEN CHI CONG on 8/24/19.
//  Copyright © 2019 [iF] Solution. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController: ModuleInterface {
    public convenience init(rootModule: ModuleInterface) {
        self.init(rootViewController: rootModule.userInterface)
    }
}

extension ModuleInterface {
    public func embededInNavigation() -> ModuleInterface {
        guard let navigation = userInterface.navigationController else {
            return UINavigationController(rootModule: self)
        }
        return navigation
    }
}
