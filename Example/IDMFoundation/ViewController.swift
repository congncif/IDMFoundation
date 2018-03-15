//
import IDMCore
import IDMFoundation
import ObjectMapper
import SwinjectAutoregistration
import SwinjectStoryboard
//  ViewController.swift
//  IDMFoundation
//
//  Created by congncif on 02/01/2018.
//  Copyright (c) 2018 congncif. All rights reserved.
//

import UIKit

class ExamParameter: RequestParameter {
    var query: String = ""
}

class ExamProvider: BaseDataProvider<ExamParameter> {
    override func requestPath(parameters: ExamParameter?) -> String {
        return "https://www.api.com/exam"
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

        let exam = ExamModel(JSON: [
            "message": "test",
            "data": [
                "name": "name"
            ]
        ])
        
        print(exam)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func beginLoading() {
    }

    override func finishLoading() {
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
