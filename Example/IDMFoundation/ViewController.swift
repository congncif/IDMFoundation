import Alamofire
import IDMCore
import IDMFoundation
import ObjectMapper
import SiFUtilities
import SwinjectAutoregistration
import SwinjectStoryboard
import UIKit

class ErrorHandler: ErrorHandlingProtocol {
    static let shared = ErrorHandler()

    func handle(error: Error?) {
        let vc = UIApplication.topViewController()
        vc?.handle(error: error)
    }
}

struct TestStringProtocolObject: StringKeyValueProtocol {
    var id: Int? = 123
    var name: String? = "name"
}

class ExamParameter: RequestParameter {
    var query: String = ""
}

class XXX: BaseUploadProvider<String> {
    override var trackingProgressEnabled: Bool {
        return false
    }
}

class ExamProvider: BaseDataProvider<ExamParameter> {
    override func requestPath(parameters: ExamParameter?) -> String {
        return "https://www.api.com/exam"
    }

    override func testResponseData(parameters: ExamParameter?) -> (Bool, Any?, Error?)? {
        let keeper = ValueKeeper<ProviderResponseAny> { fullfill in
            DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
                fullfill((false, "{ \"status\": 1 }", NSError(domain: "xxx", code: 1, userInfo: [NSLocalizedDescriptionKey: "XXX"])))
            }
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

public class ExamService: MagicalIntegrator<RootAnyProvider<ExamParameter>, XAD> {
    convenience init() {
        self.init(dataProvider: ExamProvider())
    }
}

class AnimalService: AmazingIntegrator<BetaExamProvider> {
}

class XAD: ResponseModel, ModelProtocol {
}

open class BaseDataProcessor<ModelType>: NSObject, DataProcessingProtocol {
    open func process(data: ModelType?) {
        print("Need override function \(#function) to process data: \(String(describing: data))")
    }
}


protocol ExamInterface: LoadingProtocol, ErrorHandlingProtocol {
    var examProcessor: BaseDataProcessor<XAD> { get }
}

class ViewStateX {
    var name: String?
}

class ViewController: UIViewController {
    var service: ExamService = ExamService()
    var service2: AnimalService = AnimalService(dataProvider: BetaExamProvider())
    let downloadService = XAService()
    let testService = TestService()
    var state = ViewStateX()

    override func viewDidLoad() {
        super.viewDidLoad()

        ProviderConfiguration.shared.customURLRequest = {
            request in
            var newRequst = request
            newRequst.timeoutInterval = 5
            return newRequst
        }

//        let parma = XARequestParameter(downloadPath: "http://st.phunuonline.com.vn/staticFile/Subject/2017/10/11/soi-cong-thuc-lam-dep-cua-hotgirl-viet_1_11183762.jpg")
//
//        downloadService.prepareCall(parameters: parma).onProgress { (res) in
//            print(res?.progress?.fractionCompleted)
//            }.onSuccess { (res) in
//                print(res?.data?.destinationURL)
//        }.call()
//
        testService.prepareCall().onSuccess { _ in

        }.call()

//        beginLoading()
//
        ////        let obj = TestStringProtocolObject(id: 123, name: "Name here")
        ////        let param = obj.queryParameters
        ////        print(param)
//        ResponseModelConfiguration.shared.statusKey = "status"
//        ResponseModelConfiguration.shared.validator =  { model in
//            if model.status == 1 {
//                return CommonError(title: "Error", message: "Failed status")
//            }
//            return nil
//        }
//
//        service.prepareCall()
//            .onSuccess({ (xad) in
//                print(xad)
//            })
//            .onError { (err) in
//            print(err?.localizedDescription)
//        }.call()

//        service.prepareCall().loading(monitor: self).error(handler: ErrorHandler.shared).call()

//        service2.prepareCall().call()
    }
    
    deinit {
        print("XXXXX")
    }

    override func viewDidDisplay() {
//        service.prepareCall()
//            .onSuccess { model in
//                print("ALOG: \(String(describing: model))")
//            }
//            .onError({ (err) in
//                print(err ?? "")
//            })
//            .retry(3, silent: false)
//            .call()

//        service2.prepareCall().onSuccess { res in
//            print(res)
//        }.onError { err in
//            print(err)
//        }.call()

//        let num = NSNumber(booleanLiteral: true)
//        let num2 = NSNumber(value: 111)
//        print(String(describing: num))
//        print(String(describing: num2))
    }
}

// extension SwinjectStoryboard {
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
// }
