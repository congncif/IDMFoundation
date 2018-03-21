//
//  ViewController.swift
//  IDMFoundation
//
//  Created by congncif on 02/01/2018.
//  Copyright (c) 2018 congncif. All rights reserved.
//

import UIKit
import IDMCore
import IDMFoundation
import ObjectMapper
import SiFUtilities
import SwinjectAutoregistration
import SwinjectStoryboard

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
                fullfill((false, "XXXX", NSError(domain: "", code: 1, userInfo: nil)))
            })
        }
        return keeper.syncValue
    }
}

class BetaExamProvider: BaseDataProvider<ExamParameter> {
    override func requestPath(parameters: ExamParameter?) -> String {
        return "https://www.beta-api.com/exam"
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

class ExamService: MagicalIntegrator<BaseDataProvider<ExamParameter>, ExamModel> {
}

class ViewController: UIViewController {
    var service: ExamService!

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
    }

    override func beginLoading() {
        print("Loading")
    }

    override func finishLoading() {
        print("Finished")
    }
}

extension SwinjectStoryboard {
    @objc class func setup() {
        defaultContainer.autoregister(BaseDataProvider<ExamParameter>.self, initializer: ExamProvider.init)
        defaultContainer.autoregister(ExamService.self, initializer: ExamService.init(dataProvider:))
        defaultContainer.storyboardInitCompleted(ViewController.self) { r, c in
            c.service = r.resolve(ExamService.self)
        }
    }
}
