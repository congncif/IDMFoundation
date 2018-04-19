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

extension LoadingProtocol where Self: UIViewController {
    public func beginLoading() {
        let hud = JGProgressHUD(style: .light)
        hud.textLabel.text = "Loading...".localized
        hud.show(in: view)
    }
    
    public func finishLoading() {
        JGProgressHUD.allProgressHUDs(in: view).forEach { (hud) in
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

extension ProgressLoadingProtocol where Self: UIViewController {
    public func beginLoading() {
        let hud = JGProgressHUD(style: .light)
        hud.indicatorView = JGProgressHUDPieIndicatorView()
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
            hud?.progress = Float(value)
            hud?.textLabel.text = "Loading...".localized
            hud?.detailTextLabel.text = (value * 100).intValue.stringValue + "% " + "Complete".localized
        }
    }
}
