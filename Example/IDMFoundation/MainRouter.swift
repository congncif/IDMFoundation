//
//  MainRouter.swift
//  IDMFoundation
//
//  Created by FOLY on 11/8/18.
//  Copyright © 2018 [iF] Solution. All rights reserved.
//

import Foundation
import IDMFoundation
import UIKit

protocol NextSubject: class {
    var delegate: NextObserver? { get set }
}

protocol NextObserver: class {
    func nextChange()
}

protocol MainRouterProtocol: RouterProtocol {
    func openModuleNext()
}

protocol NextRouterProtocol: RouterProtocol {
}

class MainRouter: Router, MainRouterProtocol {
    func openModuleNext() {
        let nextModule = NextModuleBuidler().build()
        
        if let destination = nextModule.viewController as? NextSubject,
            let source = sourceModule as? NextObserver {
            destination.delegate = source
        }
        
        self.open(nextModule, transition: ModalTransition())
    }
}

class NextRouter: Router, NextRouterProtocol, NextSubject {
    weak var delegate: NextObserver?
}

class MainVC: UIViewController, ModuleInterface, NextObserver {
    var router: MainRouterProtocol?

    func next() {
        self.router?.openModuleNext()
    }
    
    func nextChange() {
        
    }
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
