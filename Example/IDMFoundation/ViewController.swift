//
//  ViewController.swift
//  IDMFoundation
//
//  Created by congncif on 02/01/2018.
//  Copyright (c) 2018 congncif. All rights reserved.
//

import UIKit
import IDMFoundation
import ObjectMapper

class Noti: RequestParameter {
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        BaseUploadProvider<String>()
        Noti()
        ForwardParameterProvider<String>()
        ResponseModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

