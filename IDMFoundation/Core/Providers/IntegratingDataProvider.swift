//
//  IntegratingDataProvider.swift
//  IDMFoundation
//
//  Created by FOLY on 12/27/18.
//

import Foundation
import IDMCore

/* A wrapped provider enables to create a sequence integration */
open class IntegratingDataProvider<P, R, I: AbstractIntegrator<P, R>>: RootProvider<P, R> {
    public var service: I
    public init(_ service: I) {
        self.service = service
    }

    open override func request(parameters: P?, completion: @escaping (Bool, R?, Error?) -> Void) -> CancelHandler? {
        service
            .prepareCall(parameters: parameters)
            .onSuccess { result in
                completion(true, result, nil)
            }
            .onError { error in
                completion(false, nil, error)
            }
            .call()

        return nil
    }
}

// Use these quick wrap providers to create a sequence of tasks easily

extension AbstractIntegrator {
    /// Create provider from a service to begin a sequence integration
    public var wrappedProvider: IntegratingDataProvider<GParameterType, GResultType, AbstractIntegrator> {
        return IntegratingDataProvider(self)
    }
}
