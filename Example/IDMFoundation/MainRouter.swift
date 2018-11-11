//
//  MainRouter.swift
//  IDMFoundation
//
//  Created by FOLY on 11/8/18.
//  Copyright © 2018 [iF] Solution. All rights reserved.
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
        let nextModule = NextModuleBuidler().build()
        self.open(nextModule, transition: ModalTransition())
    }
}

class NextRouter: Router, NextRouterProtocol {
    
}

class MainVC: UIViewController {
    
}

class NextVC: UIViewController, ModuleInterface {
    var router: NextRouterProtocol?
    var presenter: ExamPresenterProtocol?
}

struct NextModuleBuidler: ModuleBuilder {
    func build() -> ModuleInterface {
        let vc = NextVC()
        vc.presenter = ExamPresenter(service: ExamService())
        let router = NextRouter()
        router.sourceModule = vc
        vc.router = router
        return vc
    }
}
