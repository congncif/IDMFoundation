//
//  TestBridge.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 12/15/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation

final class TestBridge: NSObject {
    private(set) var myPresenter = TestPresenter()

    @IBOutlet private weak var viewController: TestViewController!
    @IBOutlet private weak var controller: TestController!
    @IBOutlet private weak var contentView: TestView!
    @IBOutlet private weak var navigationView: TestNavigationView!

    override init() {
        super.init()
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        controller.setPresenter(myPresenter)
        myPresenter.actionDelegate = controller
        viewController.pair(with: controller)
        viewController.actionDelegate = controller

        viewController.loadViewIfNeeded()

        myPresenter.add(errorHandler: viewController.asErrorHandler())
        myPresenter.dataLoadingHandler = contentView.asLoadingHandler()
        
        navigationView.actionDelegate = controller
        contentView.actionDelegate = controller

        // Connect to show
        myPresenter.openConnectionToView(contentView)
        myPresenter.openConnectionToView(navigationView)

        // Connect internal router
        let router = TestRouter(sourceModule: viewController)
        controller.connect(router: router)
    }
}
