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
    func openModuleNext(x: String)
}

protocol NextRouterProtocol: RouterProtocol {
}

class MainRouter: Router, MainRouterProtocol {
    var nextBuilder: NextModuleBuilder?

    public init(nextBuilder: NextModuleBuilder?) {
        self.nextBuilder = nextBuilder
    }

    func openModuleNext(x: String) {
        guard let nextModule = nextBuilder?.config(x: x).build() else {
            return
        }

        if let destination = nextModule as? NextSubject,
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
        self.router?.openModuleNext(x: "A")
    }

    func nextChange() {
    }
}

class NextVC: UIViewController, ModuleInterface {
    var router: NextRouterProtocol?
    var presenter: ExamPresenterProtocol?
}

protocol NextModuleBuilder: ModuleBuilder {
    mutating func config(x: String) -> Self
}

struct NextModuleBuidler: NextModuleBuilder {
    var x: String?

    mutating func config(x: String) -> NextModuleBuidler {
        self.x = x
        return self
    }

    func build() -> ModuleInterface {
        let vc = NextVC()
        vc.presenter = ExamPresenter(service: ExamService())
        let router = NextRouter()
        router.sourceModule = vc
        vc.router = router
        return vc
    }
}

struct MainModuleBuilder: ModuleBuilder {
    func build() -> ModuleInterface {
        let router = MainRouter(nextBuilder: NextModuleBuidler())
//        let service =
//        let presenter
        let vc = MainVC()
//        vc.presenter =
        vc.router = router
        return vc
    }
}

struct RootRouter: RootRouterProtocol {
    var window: UIWindow?

    public init(window: UIWindow?) {
        self.window = window
    }
}

func appLaunch() {
    let vc = MainModuleBuilder().build()
    
    let root = RootRouter(window: UIApplication.shared.keyWindow)
    root.launch(vc)
}
