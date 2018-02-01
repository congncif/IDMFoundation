//
//  UIViewController+Extentions.swift
//
//
//  Created by NGUYEN CHI CONG on 7/6/17.
//  Copyright © 2017 NGUYEN CHI CONG. All rights reserved.
//

import Foundation
import UIKit
import SiFUtilities
import MBProgressHUD

public protocol LoadingProtocol: class {
    func startLoading()
    func stopLoading()
}

public protocol ErrorHandlingProtocol: class {
    func showError(_: Error?)
}

public protocol ProgressLoadingProtocol: ProviderProgressTrackingDelegate {
    func startProgressLoading()
    func stopProgressLoading()
}

extension UIViewController: LoadingProtocol {
    open func startLoading() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    open func stopLoading() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

extension UIViewController: ErrorHandlingProtocol {
    open func showError(_ error: Error?) {
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

extension UIViewController: ProgressLoadingProtocol {
    open func progressDidUpdate(progress: Double) {
        let hud = MBProgressHUD(for: self.view)
        hud?.progress = Float(progress)
    }
    
    open func startProgressLoading() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .determinateHorizontalBar
    }
    
    open func stopProgressLoading() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
