//
//  ConnectionManager.swift
//
//
//  Created by NGUYEN CHI CONG on 4/11/17.
//  Copyright © 2017 [iF] Solution Co., Ltd. All rights reserved.
//

import CWStatusBarNotification
import Foundation
import Reachability
import SiFUtilities

extension Notification.Name {
    public static let InternetAvailable = Notification.Name("internet-available")
    public static let InternetNotAvailable = Notification.Name("internet-not-available")
}

public class ConnectionManager {
    public static let shared = ConnectionManager()

    private var reachability: Reachability
    private lazy var notification: CWStatusBarNotification = {
        let notif = CWStatusBarNotification()
        return notif
    }()

    init() {
        reachability = Reachability.forInternetConnection()

        reachability.reachableBlock = { [weak self] reachability in
            // this is called on a background thread, but UI updates must
            // be on the main thread, like this:
            guard let this = self, let reach = reachability else { return }
            DispatchQueue.main.async {
                if reach.currentReachabilityStatus() == NetworkStatus.ReachableViaWiFi {
                    print("Reachable via WiFi")
                } else {
                    print("Reachable via Cellular")
                }
                this.hideNotification()
                NotificationCenter.default.post(name: NSNotification.Name.InternetAvailable, object: nil)
            }
        }
        reachability.unreachableBlock = { [weak self] _ in
            // this is called on a background thread, but UI updates must
            // be on the main thread, like this:
            DispatchQueue.main.async {
                print("Not reachable")
                self?.showNotification()
                NotificationCenter.default.post(name: NSNotification.Name.InternetNotAvailable, object: nil)
            }
        }
    }

    public func startMonitoring() {
        reachability.startNotifier()
    }

    public func stopMonitoring() {
        reachability.stopNotifier()
    }

    public var internetAvailable: Bool {
        return reachability.currentReachabilityStatus() == .ReachableViaWiFi || reachability.currentReachabilityStatus() == .ReachableViaWWAN
    }

    private func showNotification() {
        notification.display(withMessage: "No Internet Connection".localized, completion: nil)
    }

    private func hideNotification() {
        notification.dismiss()
    }
}
