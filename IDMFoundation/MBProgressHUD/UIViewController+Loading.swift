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
        MBProgressHUD.showAdded(to: self.view, animated: true)
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

public protocol ProgressLoadingProtocol: class {
    func startProgressLoading()
    func stopProgressLoading()
    func progressDidUpdate(progress: Double)
}

extension UIViewController: ProgressLoadingProtocol {
    @objc open func progressDidUpdate(progress: Double) {
        let hud = MBProgressHUD(for: view)
        hud?.progress = Float(progress)
    }

    @objc open func startProgressLoading() {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .determinateHorizontalBar
    }

    @objc open func stopProgressLoading() {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
