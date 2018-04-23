//
//  UIViewController+Loading.swift
//  IDMFoundation
//
//  Created by FOLY on 4/19/18.
//

import Foundation
import IDMCore
import JGProgressHUD
import SiFUtilities
import UIKit

extension UIViewController: LoadingProtocol {
    @objc open func beginLoading() {
        let hud = JGProgressHUD(style: .light)
        hud.textLabel.text = "Loading...".localized
        hud.show(in: view)
    }

    @objc open func finishLoading() {
        JGProgressHUD.allProgressHUDs(in: view).forEach { hud in
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

extension UIViewController: ProgressLoadingProtocol {
    @objc open func beginProgressLoading() {
        let hud = JGProgressHUD(style: .light)
        hud.indicatorView = JGProgressHUDPieIndicatorView()
        hud.textLabel.text = "Loading...".localized
        hud.detailTextLabel.text = "0% " + "Complete".localized
        hud.show(in: view)
    }

    @objc open func finishProgressLoading() {
        JGProgressHUD.allProgressHUDs(in: view).forEach { hud in
            hud.dismiss()
        }
    }

    @objc open func loadingDidUpdateProgress(_ progress: Progress?) {
        if let value = progress?.fractionCompleted {
            let hud = JGProgressHUD.allProgressHUDs(in: view).first
            hud?.progress = Float(value)
            hud?.textLabel.text = "Loading...".localized
            hud?.detailTextLabel.text = (value * 100).intValue.stringValue + "% " + "Complete".localized
        }
    }
}
