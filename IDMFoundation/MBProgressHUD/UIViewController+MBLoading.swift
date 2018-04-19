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

extension UIViewController: LoadingProtocol {
    @objc open func beginLoading() {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = "Loading...".localized
    }

    @objc open func finishLoading() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension UIViewController: ErrorHandlingProtocol {
    @objc open func handle(error: Error?) {
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

extension ProgressLoadingProtocol where Self: UIViewController {
    public func beginLoading() {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = "Loading...".localized
        hud.mode = .determinateHorizontalBar
    }
    
    public func finishLoading() {
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    public func loadingDidUpdateProgress(_ progress: Progress?) {
        if let value = progress?.fractionCompleted {
            let hud = MBProgressHUD(for: view)
            hud?.progress = Float(value)
        } else {
            let hud = MBProgressHUD(for: view)
            hud?.label.text = "Processing".localized
        }
    }
}