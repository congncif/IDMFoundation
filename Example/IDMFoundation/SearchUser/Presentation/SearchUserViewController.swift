//
//  SearchUserViewController.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 1/27/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation
import ModuleX
import SDWebImage
import UIKit
import ViewStateCore
import SiFUtilities

final class SearchUserViewController: UIViewController, SearchUserControllerProtocol, SearchUserModuleInterface, SearchUserViewActionDelegate {
    public var output: SearchUserOutputProtocol?
    public var router: SearchUserRouterProtocol?

    var presenter: SearchUserPresenterProtocol!
    var integrator: SearchUserAbstractIntegrator!

    private var customView: UIView?

    init(customView: UIView) {
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func loadView() {
        if let customView = customView {
            view = customView
        } else {
            super.loadView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidFinishInitialLayout() {
        viewReady()
    }

    public func start(with query: String) {
        presenter.start(with: query)
    }
}
