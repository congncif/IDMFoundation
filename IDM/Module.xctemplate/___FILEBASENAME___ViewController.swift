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
import UIKit
import ViewStateCore

public class ___VARIABLE_moduleName___ViewController: UIViewController, ModuleInterface {
	public var router: ___VARIABLE_moduleName___RouterProtocol?
	public var presenter: ___VARIABLE_moduleName___PresenterProtocol?

	public override func viewDidLoad() {
        super.viewDidLoad()
    }

    public override func viewDidFinishLayout() {
        presenter.state.subscribe(for: self)
    }
}

extension ___VARIABLE_moduleName___ViewController: ViewStateSubscriber, ViewStateRenderable {
    public func render(state: ViewState) {
        <#render UI here#>
    }
}
