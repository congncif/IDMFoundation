//
//  UIViewController+Extentions.swift
//
//
//  Created by NGUYEN CHI CONG on 7/6/17.
//  Copyright © 2017 NGUYEN CHI CONG. All rights reserved.
//

import Foundation
import IDMCore
import MBProgressHUD
import SiFUtilities
import UIKit

extension LoadingProtocol where Self: UIView {
    public func beginLoading() {
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.label.text = "Loading...".localized
    }

    public func finishLoading() {
        MBProgressHUD.hide(for: self, animated: true)
    }
}

extension ErrorHandlingProtocol where Self: UIViewController {
    public func handle(error: Error?) {
        guard let error = error else {
            return
        }

        if let err = error as? CommonError {
            self.notify(title: err.title, message: err.message)
        } else {
            let message = error.localizedDescription
            self.notify(message: message)
        }
    }
}

extension ProgressLoadingProtocol where Self: UIView {
    public func beginProgressLoading() {
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.label.text = "Loading...".localized
        hud.detailsLabel.text = "0% " + "Complete".localized
        hud.mode = .determinateHorizontalBar
    }

    public func finishProgressLoading() {
        MBProgressHUD.hide(for: self, animated: true)
    }

    public func loadingDidUpdateProgress(_ progress: Progress?) {
        if let value = progress?.fractionCompleted {
            let hud = MBProgressHUD(for: self)
            hud?.progress = Float(value)
            hud?.label.text = "Loading...".localized
            hud?.detailsLabel.text = (value * 100).intValue.stringValue + "% " + "Complete".localized
        }
    }
}

extension UIViewController: ErrorHandlingProtocol {}
extension UIView: LoadingProtocol, ProgressLoadingProtocol {}
