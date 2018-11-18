////
////  MainRouter.swift
////  IDMFoundation
////
////  Created by FOLY on 11/8/18.
////  Copyright © 2018 [iF] Solution. All rights reserved.
////
//
//import Foundation
//import IDMFoundation
//import ModuleX
//import UIKit
//
//protocol NextSubject: class {
//    var delegate: NextObserver? { get set }
//}
//
//protocol NextObserver: class {
//    func nextChange()
//}
//
//protocol MainRouterProtocol: RouterProtocol {
//    func openModuleNext(x: String)
//}
//
//protocol NextRouterProtocol: RouterProtocol {
//}
//
//class MainRouter: Router, MainRouterProtocol {
//    var nextBuilder: NextModuleBuilder?
//
//    public init(nextBuilder: NextModuleBuilder?) {
//        self.nextBuilder = nextBuilder
//    }
//
//    func openModuleNext(x: String) {
//        guard let nextModule = nextBuilder?.config(x: x).build() else {
//            return
//        }
//
//        if let destination = nextModule as? NextSubject,
//            let source = sourceModule as? NextObserver {
//            destination.delegate = source
//        }
//
//        self.open(nextModule, transition: ModalTransition())
//    }
//}
//
//class NextRouter: Router, NextRouterProtocol, NextSubject {
//    weak var delegate: NextObserver?
//}
//
//class MainVC: UIViewController, ModuleInterface, NextObserver {
//    var router: MainRouterProtocol?
//
//    func next() {
//        self.router?.openModuleNext(x: "A")
//    }
//
//    func nextChange() {
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//}
//
//class NextVC: UIViewController, ModuleInterface {
//    var router: NextRouterProtocol?
//    var presenter: ExamPresenterProtocol?
//}
//
//protocol NextModuleBuilder: ModuleBuilder {
//    mutating func config(x: String) -> Self
//}
//
//struct NextModuleBuidler: NextModuleBuilder {
//    var x: String?
//
//    mutating func config(x: String) -> NextModuleBuidler {
//        self.x = x
//        return self
//    }
//
//    func build() -> ModuleInterface {
//        let vc = NextVC()
//        vc.presenter = ExamPresenter(service: ExamService())
//        let router = NextRouter()
//        router.sourceModule = vc
//        vc.router = router
//        return vc
//    }
//}
//
//struct MainModuleBuilder: ModuleBuilder {
//    func build() -> ModuleInterface {
//        let router = MainRouter(nextBuilder: NextModuleBuidler())
////        let service =
////        let presenter
//        let vc = MainVC()
////        vc.presenter =
//        vc.router = router
//        return vc
//    }
//}
//
//struct RootRouter: RootRouterProtocol {
//    var window: UIWindow?
//
//    public init(window: UIWindow?) {
//        self.window = window
//    }
//}
//
//func appLaunch() {
//    let vc = MainModuleBuilder().build()
//
//    let root = RootRouter(window: UIApplication.shared.keyWindow)
//    root.launch(vc)
//}
//
//protocol ModuleXInteface: ModuleInterface {
//    var delegate: String? { get }
//}
//
//protocol RouterXProtocol {
//    var sourceModule: ModuleXInteface? { get }
//    var nextBuilder: NextModuleBuilder? { get }
//
//    func openModuleNext()
//}
//
//class ModuleNew: UIViewController, ModuleXInteface {
//    var delegate: String?
//}
//
//class RouterNew: RouterXProtocol {
//    weak var sourceModule: ModuleXInteface?
//    var nextBuilder: NextModuleBuilder?
//
//    public init(sourceModule: ModuleXInteface?, nextBuilder: NextModuleBuilder?) {
//        self.sourceModule = sourceModule
//        self.nextBuilder = nextBuilder
//    }
//
//    func openModuleNext() {
//        if let next = nextBuilder?.build() {
//            self.sourceModule?.viewController.present(next.viewController)
//        }
//    }
//}
//
//open class CoResponseModel: NSObject, ResponseModelProtocol, Codable {
//    open var status: Int?
//    open var message: String?
//}
//
//open class CoDataResponeModel<DataModel: Codable>: CoResponseModel {
//    open var data: DataModel?
//}
