//
//  MainRouter.swift
//  MyViettelPost
//
//  Created by FOLY on 11/8/18.
//  Copyright © 2018 ViettelPost. All rights reserved.
//

import Foundation
import UIKit
import IDMFoundation

protocol MainRouterProtocol: class {
    func openModuleNext()
}

protocol NextRouterProtocol: class {
    
}

class MainRouter: Router, MainRouterProtocol {
    func openModuleNext() {
        let nextModule = NextBuilder().buildModule()
        self.open(nextModule, transition: ModalTransition())
    }
}

class NextRouter: Router, NextRouterProtocol {
    
}

struct NextBuilder {
    func buildModule() -> NextVC {
        let vc = NextVC()
        let router = NextRouter(sourceViewController: vc)
        vc.router = router
        return vc
    }
}

class MainVC: UIViewController {
    
}

class NextVC: UIViewController {
    var router: NextRouterProtocol?
}
