//
//  ExampleChanges.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 1/25/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import SiFUtilities
import IDMCore
import Alamofire
import IDMFoundation


extension NetworkRoute {
    init(endpoint: EndpointProtocol, method: HTTPMethod) {
        self.init(endpoint: endpoint, method: method, headers: ["x-token": "XXXXXXX"])
    }
}

enum ApiEndpoint: String, EndpointProtocol {
    case users

    enum User: String, EndpointProtocol {
        static var root = "user"

        case update = "%@/update"
    }
}

struct UserRoute {
    static let profile = NetworkRoute(endpoint: ApiEndpoint.users, method: .get)
    static let update = NetworkRoute(endpoint: ApiEndpoint.User.update, method: .post)
}

struct User: ParameterProtocol {
    var id: String

    func build(from endpoint: EndpointProtocol) throws -> URL {
        return try endpoint.path(id).asURL()
    }
}

class CustomProvider: BaseDataProvider<User> {}

class XTest {
    lazy var provider: CustomProvider = {
        let route = UserRoute.update
        return CustomProvider(route: route)
    }()

    func get() {
        _ = provider.request(parameters: User(id: "uid")) { _, _, _ in
        }
    }
}
