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

extension LoadingProtocol where Self: UIView {
    public func beginLoading() {
        let hud = JGProgressHUD(style: .light)
        hud.textLabel.text = "Loading...".localized
        hud.show(in: self)
    }
    
    public func finishLoading() {
        JGProgressHUD.allProgressHUDs(in: self).forEach { (hud) in
            hud.dismiss()
        }
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
        let hud = JGProgressHUD(style: .light)
        hud.indicatorView = JGProgressHUDPieIndicatorView()
        hud.textLabel.text = "Loading...".localized
        hud.detailTextLabel.text = "0% " + "Complete".localized
        hud.show(in: self)
    }
    
    public func finishProgressLoading() {
        JGProgressHUD.allProgressHUDs(in: self).forEach { (hud) in
            hud.dismiss()
        }
    }
    
    public func loadingDidUpdateProgress(_ progress: Progress?) {
        if let value = progress?.fractionCompleted {
            let hud = JGProgressHUD.allProgressHUDs(in: self).first
            if value == 1 {
                hud?.indicatorView = JGProgressHUDSuccessIndicatorView()
            } else {
                hud?.progress = Float(value)
            }
            hud?.textLabel.text = "Loading...".localized
            hud?.detailTextLabel.text = (value * 100).intValue.stringValue + "% " + "Complete".localized
        }
    }
}

extension UIViewController: ErrorHandlingProtocol {}
extension UIView: LoadingProtocol, ProgressLoadingProtocol {}
