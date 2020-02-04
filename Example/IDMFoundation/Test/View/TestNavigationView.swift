//
//  TestNavigationView.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 12/15/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import ViewStateCore

final class TestNavigationView: NSObject, TestViewProtocol {
	weak var actionDelegate: TestViewActionDelegate?
    
    @IBOutlet weak var navigationItem: UINavigationItem!
}

extension TestNavigationView: DedicatedViewStateFillable {
    func dedicatedFillingOptions(_ state: TestViewState) -> [FillingOption] {
        // <#Configure to render View here#>
        return []
    }
}
