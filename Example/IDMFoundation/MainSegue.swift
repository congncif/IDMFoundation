//
//  MainSegue.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 2/10/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class MainSegue: UIStoryboardSegue, MainRouterProtocol {
    func openSearchModule(with query: String) {
        if let target = destination as? SearchUserModuleInterface {
            target.start(with: query)
        }
    }
}
