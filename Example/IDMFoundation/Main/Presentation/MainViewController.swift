//
//  MainViewController.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 3/2/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import ViewStateCore

public class MainViewController: UIViewController, MainControllerProtocol, MainViewActionDelegate, MainModuleInterface {
    
	public var output: MainOutputProtocol?

	var router: MainRouterProtocol!

	var presenter: MainPresenterProtocol!

    private var customView: UIView?

    init(customView: UIView) {
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public override func loadView() {
        if let customView = customView {
            view = customView
        } else {
            super.loadView()
        }
    }

	public override func viewDidLoad() {
        super.viewDidLoad()
        viewReady()
    }
    
    public func selectUser(_ user: SearchUserModel) {
        presenter.selectUser(user)
    }
}
