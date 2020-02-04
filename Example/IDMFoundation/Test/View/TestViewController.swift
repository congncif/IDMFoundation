//
//  TestViewController.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 12/15/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import ViewStateCore

final class TestViewController: UIViewController, TestModuleInterface, TestViewProtocol {
    // MARK: - Controller
    
    private var myModuleController: TestModule!

    public func pair(with moduleController: TestModule) {
        self.myModuleController = moduleController
    }

    public var moduleController: TestModule {
        if myModuleController == nil {
            assertionFailure("💥💥💥 ModuleController was not set before using.")
        }
        return myModuleController
    }

    // MARK: - ActionDelegate

    weak var actionDelegate: TestViewActionDelegate?

    // MARK: - Lifecycle

	override func viewDidLoad() {
        super.viewDidLoad()

        actionDelegate?.activate()
    }

    // MARK: - Privates
}

extension TestViewController: DedicatedViewStateFillable {
    func dedicatedFillingOptions(_ state: TestViewState) -> [FillingOption] {
        // <#Configure to render View here#>
        return []
    }
}
