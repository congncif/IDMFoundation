//
//  AppDelegate.swift
//  IDMFoundation
//
//  Created by congncif on 02/01/2018.
//  Copyright (c) 2018 congncif. All rights reserved.
//
import Alamofire
import IDMCore
import IDMFoundation
import UIKit

public class Person: Codable {
    public var fullName: String
    public var age: Int
    public enum Gender: String, Codable {
        case male
        case female
    }
    
    public var gender: Gender
    private enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case age
        case gender
        
        var description: String {
            return rawValue
        }
    }
}

public class CLGT: ModelProtocol {
    public required init(fromData data: Any?) throws {
        throw IDMError.modelCannotInitialize
    }
    
    public typealias DataType = Any
}

// public class XResponse: Codable, ModelProtocol, ResponseModelProtocol {
//    public var message: String?
//    public var status: Int?
//    var data: Person?
// }

public protocol PlaceholderBuilderProtocol {
    func getInstance<Type>() -> Type?
}

public struct PlaceholderBuilder<Type>: PlaceholderBuilderProtocol {
    public func getInstance<Type>() -> Type? {
        return placeholder as? Type
    }
    
    public var placeholder: Type
    
    init(placeholder: Type) {
        self.placeholder = placeholder
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    var simpleIntegrator = AbstractIntegrator<Any, String>()
    var simpleCreator: PlaceholderBuilderProtocol? = PlaceholderBuilder(placeholder: AbstractIntegrator<Any, String>())
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        let text = "{\"status\":0,\"data\":{\"full_name\":\"Cong\",\"age\":18,\"gender\":\"male\"}}"
        
        print(text)
        
        ResponseModelConfiguration.shared.validator = { _ in
            IDMError(message: "XX")
        }
        
//        let res = try? XResponse(fromData: text)
//        let er = res?.invalidDataError
//
//        print(er?.localizedDescription)
        
//        simpleIntegrator.prepareCall().call()
        
        if let creator = simpleCreator, let simple2: AbstractIntegrator<Any, String> = creator.getInstance() {
            simple2.prepareCall().call()
        }
        
        return true
    }
}
