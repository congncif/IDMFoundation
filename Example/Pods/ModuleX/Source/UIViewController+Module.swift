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

extension ModuleInterface {
    public func pushModule(_ destinationModule: ModuleInterface, animated: Bool = true) {
        navigationController?.pushViewController(destinationModule.userInterface, animated: animated)
    }

    public func popModule(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }

    public func popToModule(_ destinationModule: ModuleInterface, animated: Bool) {
        navigationController?.popToViewController(destinationModule.userInterface, animated: animated)
    }

    public func popToRootModule(animated: Bool) {
        navigationController?.popToRootViewController(animated: animated)
    }

    public func presentModule(_ destinationModule: ModuleInterface,
                              animated: Bool = true,
                              completion: (() -> Void)? = nil) {
        userInterface.present(destinationModule.userInterface, animated: true, completion: completion)
    }

    public func dismissModule(animated: Bool, completion: (() -> Void)? = nil) {
        userInterface.dismiss(animated: animated, completion: completion)
    }

    private var navigationController: UINavigationController? {
        if let nav = userInterface as? UINavigationController {
            return nav
        }
        return userInterface.navigationController
    }
}
