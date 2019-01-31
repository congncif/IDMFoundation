//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation
import IDMCore
import IDMFoundation
import ModuleX
import UIKit
import ViewStateCore

public class ___VARIABLE_moduleName___ViewController: UIViewController, ___VARIABLE_moduleName___ModuleInterface {
	public var presenter: ___VARIABLE_moduleName___PresenterProtocol?

	public override func viewDidLoad() {
        super.viewDidLoad()

        // Keep this at end of viewDidLoad
        subscribeStateChange(state)
    }
}

extension ___VARIABLE_moduleName___ViewController: ViewStateSubscriber, ViewStateRenderable {
    public func render(state: ViewState) {
//        <#render UI here#>
    }
}
