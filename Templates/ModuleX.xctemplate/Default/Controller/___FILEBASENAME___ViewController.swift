//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import UIKit
import ViewStateCore

final class ___VARIABLE_moduleName___ViewController: UIViewController, ___VARIABLE_moduleName___ControllerProtocol, ___VARIABLE_moduleName___ModuleInterface {
    public var output: ___VARIABLE_moduleName___OutputProtocol?
    public var router: ___VARIABLE_moduleName___RouterProtocol?

    var presenter: ___VARIABLE_moduleName___PresenterProtocol!
    var integrator: ___VARIABLE_moduleName___AbstractIntegrator!

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
        activateView()
    }
}

extension ___VARIABLE_moduleName___ViewController: ___VARIABLE_moduleName___ViewActionDelegate {}
