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

import ModuleX

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RootRouterProtocol {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        LogConfiguration.level = .debug
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainBuilder = MainBuilder()
        let mainModule = mainBuilder.build()
        
        // build navigation module
        let nav = UINavigationController(rootViewController: mainModule.viewController)
        
        launch(nav)
        
        window?.makeKeyAndVisible()
        
//        String.localizedStringWithFormat(NSLocalizedString("%d x", comment: ""))
        
        return true
    }
}
