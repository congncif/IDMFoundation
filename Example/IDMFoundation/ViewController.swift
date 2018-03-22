import Alamofire
import IDMCore
import IDMFoundation
import ObjectMapper
import SiFUtilities
import SwinjectAutoregistration
import SwinjectStoryboard
import UIKit

class ExamParameter: RequestParameter {
    var query: String = ""
}

class ExamProvider: BaseDataProvider<ExamParameter> {
    override func requestPath(parameters: ExamParameter?) -> String {
        return "https://www.api.com/exam"
    }

    override func testResponseData(parameters: ExamParameter?) -> (Bool, Any?, Error?)? {
        let keeper = ValueKeeper<ProviderResponseAny> { fullfill in
            DispatchQueue.global().asyncAfter(deadline: .now() + 3, execute: {
                fullfill((true, "XXXX", NSError(domain: "", code: 1, userInfo: nil)))
            })
        }
        return keeper.syncValue
    }
}

class BetaExamProvider: BaseDataProvider<ExamParameter> {
    override func requestPath(parameters: ExamParameter?) -> String {
        return "https://dog.ceo/api/breeds/list/all"
    }
}

class Exam: Mappable {
    var name: String = ""

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        name <- map["name"]
    }
}

class ExamModel: DataResponseModel<Exam>, ModelProtocol {
}

class ExamService: MagicalIntegrator<RootProvider<ExamParameter>, ExamModel> {
    convenience init() {
        self.init(dataProvider: ExamProvider())
    }
}

class AnimalService: AmazingIntegrator<BetaExamProvider> {
}

class ViewController: UIViewController {
    var service: ExamService = ExamService()
    var service2: AnimalService = AnimalService(dataProvider: BetaExamProvider())

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidDisplay() {
        service.prepareCall()
            .onSuccess { model in
                print("ALOG: \(String(describing: model))")
            }
            .onError({ (err) in
                print(err ?? "")
            })
            .retry(3, silent: false)
            .call()

//        service2.prepareCall().onSuccess { res in
//            print(res)
//        }.onError { err in
//            print(err)
//        }.call()
    }

    override func beginLoading() {
        print("Loading")
    }

    override func finishLoading() {
        print("Finished")
    }
}

//extension SwinjectStoryboard {
//    @objc class func setup() {
//        defaultContainer.autoregister(BaseDataProvider<ExamParameter>.self, initializer: ExamProvider.init)
//        defaultContainer.autoregister(ExamService.self, initializer: ExamService.init)
//        defaultContainer.autoregister(BetaExamProvider.self, initializer: BetaExamProvider.init)
//        defaultContainer.autoregister(AnimalService.self, argument: IntegrationType.self, initializer: AnimalService.init(dataProvider: executingType:))
////        defaultContainer.register(AnimalService.self) { (resolver) -> AnimalService in
////            if let pro = resolver.resolve(BetaExamProvider.self) {
////                return AnimalService(dataProvider: pro)
////            }
////            fatalError()
////        }
//        defaultContainer.storyboardInitCompleted(ViewController.self) { r, c in
//            c.service = r.resolve(ExamService.self)
//            c.service2 = r.resolve(AnimalService.self)
//        }
//    }
//}

