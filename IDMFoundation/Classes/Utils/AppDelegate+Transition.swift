//
//  AppDelegate+Extensions.swift
//  
//
//  Created by NGUYEN CHI CONG on 1/22/17.
//  Copyright © 2017 [iF] Solution Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

/*********************************************************************************/
//MARK: - Show up
/*********************************************************************************/

extension AppDelegate {
    open func switchToRootViewController(_ viewController: UIViewController, options: UIViewAnimationOptions = .transitionFlipFromLeft) {
        window?.rootViewController = viewController
        
        UIView.transition(with: self.window!, duration: 0.3, options: options, animations: { () -> Void in
        }) { (finished:Bool) -> Void in
        }
    }
    
    open static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}

