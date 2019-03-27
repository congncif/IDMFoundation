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

public final class ___VARIABLE_moduleName___ViewController: UIViewController, ___VARIABLE_moduleName___ControllerProtocol, ___VARIABLE_moduleName___ViewActionDelegate, ___VARIABLE_moduleName___ModuleInterface {
    public var output: ___VARIABLE_moduleName___OutputProtocol?

    var router: ___VARIABLE_moduleName___RouterProtocol!

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
}
