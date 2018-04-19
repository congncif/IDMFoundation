//
//  UIViewController+Loading.swift
//  IDMFoundation
//
//  Created by FOLY on 4/19/18.
//

import Foundation
import JGProgressHUD
import IDMCore
import SiFUtilities
import UIKit

extension UIViewController: LoadingProtocol {
    @objc open func beginLoading() {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Loading...".localized
        hud.show(in: view)
    }

    @objc open func finishLoading() {
        JGProgressHUD.allProgressHUDs(in: view).forEach { (hud) in
            hud.dismiss()
        }
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
        let hud = JGProgressHUD(style: .dark)
        hud.indicatorView = JGProgressHUDIndicatorView()
        hud.textLabel.text = "Loading...".localized
        hud.show(in: view)
    }

    public func finishLoading() {
        JGProgressHUD.allProgressHUDs(in: view).forEach { (hud) in
            hud.dismiss()
        }
    }

    public func loadingDidUpdateProgress(_ progress: Progress?) {
        if let value = progress?.fractionCompleted {
            let hud = JGProgressHUD.allProgressHUDs(in: view).first
            hud?.textLabel.text = "Loading...".localized
            hud?.detailTextLabel.text = (value * 100).intValue.stringValue + "% " + "Complete".localized
            hud?.progress = Float(value)
        }
    }
}
