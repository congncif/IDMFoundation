//
//  AppDelegate.swift
//  IDMFoundation
//
//  Created by congncif on 02/01/2018.
//  Copyright (c) 2018 congncif. All rights reserved.
//
import Alamofire
import IDMFoundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RootRouterProtocol {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        ProviderConfiguration.shared.logger = XXXLogger()
        return true
    }

    class XXXLogger: ProviderLogger {
        override init() {
//            super.init()
        }

        override func logDataResponse(_ response: DataResponse<Any>?) {
            super.logDataResponse(response)
            print("DCM ---=====.....")
        }
    }
}
