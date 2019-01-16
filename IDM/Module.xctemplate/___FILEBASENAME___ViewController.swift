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

public class ___VARIABLE_moduleName___ViewController: UIViewController, ModuleInterface {
	public var presenter: ___VARIABLE_moduleName___PresenterProtocol?

	var state: ___VARIABLE_moduleName___ViewState {
		var _state: ___VARIABLE_moduleName___ViewState
        if let currentState = presenter?.state {
            _state = currentState
        } else {
        	assertionFailure()
        	_state = ___VARIABLE_moduleName___ViewState()
        }
        return _state
    }

	public override func viewDidLoad() {
        super.viewDidLoad()

        // Keep this at end of viewDidLoad
		state.subscribe(for: self)
    }
}

extension ___VARIABLE_moduleName___ViewController: ViewStateSubscriber, ViewStateRenderable {
    public func render(state: ViewState) {
//        <#render UI here#>
    }
}
