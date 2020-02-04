//
//  TestView.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 12/15/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import ViewStateCore

final class TestView: UIView, TestViewProtocol {
    weak var actionDelegate: TestViewActionDelegate?
}

extension TestView: DedicatedViewStateFillable {
    func dedicatedFillingOptions(_ state: TestViewState) -> [FillingOption] {
        // <#Configure to render View here#>
        return []
    }
}
