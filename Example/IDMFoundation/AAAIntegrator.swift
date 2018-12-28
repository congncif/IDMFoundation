//
//  AAAIntegrator.swift
//  IDMFoundation
//
//  Created by FOLY on 12/28/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation
import ObjectMapper

public struct AAAResponseModel {
}

extension AAAResponseModel: Mappable {
    public init?(map: Map) {
        self.init()
    }

    public mutating func mapping(map: Map) {
    }
}

extension AAAResponseModel: ModelProtocol {}

public typealias AAABaseProvider = AnyResultDataProvider<AAARequestParameter>

public class AAAIntegrator: MagicalIntegrator<AAABaseProvider, AAAResponseModel> {}

public extension AAAIntegrator {
    public convenience init() {
        self.init(dataProvider: AAADataProvider())
    }
}

public struct SubModel {
    public var uid: Int
}

extension SubModel: Codable {
    private enum CodingKeys: String, CodingKey {
        case uid
        var description: String { return rawValue }
    }
}

public struct NewModel {
    public var link: URL
    public var slug: String
    public var file: URL
    public var provider: String
    public var audiodub: Bool
    public var mediaid: Int
    public var image: String
    public var prelink: String
    public var preduration: Int
    public var buffer: Int
    public var host: URL
    public var myip: String
    public var mycountry: String
    public var user: Int
    public var errorCode: String
    public var sub: SubModel?
}

extension NewModel: Codable {
    private enum CodingKeys: String, CodingKey {
        case link
        case slug
        case file
        case provider
        case audiodub
        case mediaid
        case image
        case prelink
        case preduration
        case buffer
        case host
        case myip
        case mycountry
        case user
        case sub
        case errorCode = "error_code"

        var description: String { return rawValue }
    }
}
