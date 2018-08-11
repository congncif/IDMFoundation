//
//  TestFlow.swift
//  IDMFoundation
//
//  Created by FOLY on 8/12/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
import Alamofire
import Foundation
import IDMCore
import IDMFoundation

class TestRequestParameter: RequestParameter {
    
}

class TestResponseModel: ResponseModel, ModelProtocol {
    
}

typealias TestBaseProvider = RootAnyProvider<TestRequestParameter>
typealias TestProvider = BaseDataProvider<TestRequestParameter>

class TestDataProvider: TestProvider {
    override func requestPath(parameters: TestRequestParameter?) -> String {
        return "https://jsonplaceholder.typicode.com/posts/1"
    }

    override func httpMethod(parameters: TestRequestParameter?) -> HTTPMethod {
        return .get
    }
    
    override func logEnabled(parameters: TestRequestParameter?) -> Bool {
        return true
    }
}

class TestService: MagicalIntegrator<TestBaseProvider, TestResponseModel> {
    
}

extension TestService {
	convenience init() {
        self.init(dataProvider: TestDataProvider())
    }
}
