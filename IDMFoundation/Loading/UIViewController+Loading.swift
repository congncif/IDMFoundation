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

extension ProgressLoadingProtocol where Self: UIViewController {
    public func beginLoading() {
        FTIndicator.showProgress(withMessage: "Loading...".localized, userInteractionEnable: false)
    }

    public func finishLoading() {
        FTIndicator.dismissProgress()
    }

    public func loadingDidUpdateProgress(_ progress: Progress?) {
        if let value = progress?.fractionCompleted {
            let text = value.stringValue + "%"
            FTIndicator.showProgress(withMessage: text, userInteractionEnable: false)
        } else {
            FTIndicator.showProgress(withMessage: "Processing...".localized, userInteractionEnable: false)
        }
    }
}
