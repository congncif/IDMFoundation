//
//  UIViewController+Loading.swift
//  IDMFoundation
//
//  Created by FOLY on 4/19/18.
//

import Foundation
import FTIndicator
import IDMCore
import SiFUtilities
import UIKit

extension UIViewController: LoadingProtocol {
    @objc open func beginLoading() {
        FTIndicator.showProgress(withMessage: "Loading...".localized, userInteractionEnable: false)
    }

    @objc open func finishLoading() {
        FTIndicator.dismissProgress()
    }
}

extension UIViewController: ErrorHandlingProtocol {
    @objc open func handle(error: Error?) {
        guard let error = error else {
            return
        }
        FTIndicator.showError(withMessage: error.localizedDescription)
    }
}

public protocol ProgressLoadingProtocol: class {
    func startProgressLoading()
    func stopProgressLoading()
    func progressDidUpdate(progress: Double)
}

extension UIViewController: ProgressLoadingProtocol {
    @objc open func progressDidUpdate(progress: Double) {
        let text = progress.intValue.stringValue + "%"
        FTIndicator.showProgress(withMessage: text, userInteractionEnable: false)
    }

    @objc open func startProgressLoading() {
        FTIndicator.showProgress(withMessage: "Loading...".localized, userInteractionEnable: false)
    }

    @objc open func stopProgressLoading() {
        FTIndicator.dismissProgress()
    }
}
