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
import CoreBluetooth
import CoreLocation

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

class ViewController: UIViewController, CBPeripheralManagerDelegate {
    var service: ExamService!

    override func viewDidLoad() {
        super.viewDidLoad()
        initLocalBeacon()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func beginLoading() {
    }

    override func finishLoading() {
    }
    
    var localBeacon: CLBeaconRegion!
    var beaconPeripheralData: NSDictionary!
    var peripheralManager: CBPeripheralManager!
    
    func initLocalBeacon() {
        if localBeacon != nil {
            stopLocalBeacon()
        }
        
        let localBeaconUUID = "f7826da6-4fa2-4e98-8024-bc5b71e0893e"
        let localBeaconMajor: CLBeaconMajorValue = 123
        let localBeaconMinor: CLBeaconMinorValue = 456
        
        let uuid = UUID(uuidString: localBeaconUUID)!
        localBeacon = CLBeaconRegion(proximityUUID: uuid, major: localBeaconMajor, minor: localBeaconMinor, identifier: "region-identifier")
        
        beaconPeripheralData = localBeacon.peripheralData(withMeasuredPower: nil)
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
    }
    
    func stopLocalBeacon() {
        peripheralManager.stopAdvertising()
        peripheralManager = nil
        beaconPeripheralData = nil
        localBeacon = nil
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            peripheralManager.startAdvertising(beaconPeripheralData as! [String: AnyObject]!)
        } else if peripheral.state == .poweredOff {
            peripheralManager.stopAdvertising()
        }
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
