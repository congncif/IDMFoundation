//
//  Integrator+Extensions.swift
//
//
//  Created by NGUYEN CHI CONG on 4/8/17.
//  Copyright © 2017 [iF] Solution. All rights reserved.
//

import Foundation
import IDMCore

extension Integrator {
    open func setProgressLoadingPresenter<T: ProgressLoadingProtocol>(_ controller: T) where T: ErrorHandlingProtocol {
        self.onBeginning { [weak controller] in
            controller?.startProgressLoading()
        }
        self.onCompletion { [weak controller] in
            controller?.stopProgressLoading()
        }
        self.onError { [weak controller] (err) in
            controller?.handle(error: err)
        }
    }
}

