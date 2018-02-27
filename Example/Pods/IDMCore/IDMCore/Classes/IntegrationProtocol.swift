//
//  IntegrationProtocol.swift
//  IDMCore
//
//  Created by NGUYEN CHI CONG on 8/15/16.
//  Copyright © 2016 NGUYEN CHI CONG. All rights reserved.
//

import Foundation

public protocol LoadingProtocol {
    func beginLoading()
    func finishLoading()
}

public protocol ErrorHandlingProtocol {
    func handle(error: Error?)
}

public protocol DataProcessingProtocol {
    associatedtype ModelType
    func process(data: ModelType?)
}

public protocol IntegrationProtocol {
    associatedtype DataProviderType: DataProviderProtocol
    associatedtype ModelType: ModelProtocol
    associatedtype ResultType

    var dataProvider: DataProviderType { get }

    func execute(parameters: DataProviderType.ParameterType?,
                 completion: ((Bool, ResultType?, Error?) -> Void)?)
    func execute(parameters: DataProviderType.ParameterType?,
                 loadingHandler: (() -> Void)?,
                 successHandler: ((ResultType?) -> Void)?,
                 failureHandler: ((Error?) -> Void)?,
                 completionHandler: (() -> Void)?)

    // Add this method to handle universal call
    func prepareCall(parameters: DataProviderType.ParameterType?) -> IntegrationCall<ResultType>

    var noValueError: Error? { get }
}

extension IntegrationProtocol {

    // Default method for prepare call
    func prepareCall(parameters _: DataProviderType.ParameterType?) -> IntegrationCall<ResultType> {
        return IntegrationCall<ResultType>()
    }

    public var noValueError: Error? {
        return nil
    }
}

//////////////////////////////////////////////////////////////////////////////////////
public extension IntegrationProtocol where DataProviderType.DataType == ModelType.DataType {

    func finish(success: Bool,
                data: DataProviderType.DataType?,
                error: Error?,
                completion: ((Bool, ResultType?, Error?) -> Void)?) {

        let noValueError = self.noValueError
        if success {
            DispatchQueue.global(qos: .background).async(execute: {
                var newError = error
                var newSuccess = success
                var results: ResultType?
                if let model = ModelType(from: data) {
                    if let err = model.invalidDataError {
                        newSuccess = false
                        newError = err
                    } else {
                        results = model.getData()
                    }
                } else {
                    if let err = noValueError {
                        newSuccess = false
                        newError = err
                    }
                }

                DispatchQueue.main.async {
                    completion?(newSuccess, results, newError)
                }
            })
        } else {
            DispatchQueue.main.async {
                completion?(success, nil, error)
            }
        }
    }

    public func execute(parameters: DataProviderType.ParameterType? = nil,
                        completion: ((Bool, ResultType?, Error?) -> Void)? = nil) {
        _ = dataProvider.request(parameters: parameters) { success, data, error in
            self.finish(success: success, data: data, error: error, completion: completion)
        }
    }

    public func execute(parameters: DataProviderType.ParameterType? = nil,
                        loadingHandler: (() -> Void)?,
                        successHandler: ((ResultType?) -> Void)?,
                        failureHandler: ((Error?) -> Void)? = nil,
                        completionHandler: (() -> Void)?) {

        DispatchQueue.main.async(execute: {
            loadingHandler?()
        })
        execute(parameters: parameters) { success, model, error in
            if success {
                successHandler?(model)
            } else {
                failureHandler?(error)
            }
            defer {
                completionHandler?()
            }
        }
    }

    public func execute<DataBindingType: DataProcessingProtocol>(parameters: DataProviderType.ParameterType? = nil,
                                                                 loadingPresenter: LoadingProtocol? = nil,
                                                                 errorAlertPresenter: ErrorHandlingProtocol? = nil,
                                                                 dataBinding: DataBindingType?)
        where DataBindingType.ModelType == ResultType {
        execute(parameters: parameters, loadingHandler: {
            loadingPresenter?.beginLoading()
        }, successHandler: { data in
            dataBinding?.process(data: data)
        }, failureHandler: { error in
            errorAlertPresenter?.handle(error: error)
        }) {
            loadingPresenter?.finishLoading()
        }
    }

    public func execute<DataBindingType: DataProcessingProtocol>(parameters: DataProviderType.ParameterType? = nil,
                                                                 delegate: DataBindingType?)
        where DataBindingType: LoadingProtocol,
        DataBindingType: ErrorHandlingProtocol,
        DataBindingType.ModelType == ResultType {
        execute(parameters: parameters, loadingPresenter: delegate, errorAlertPresenter: delegate, dataBinding: delegate)
    }

    public func execute(parameters: DataProviderType.ParameterType? = nil,
                        loadingPresenter: LoadingProtocol? = nil,
                        errorAlertPresenter: ErrorHandlingProtocol? = nil,
                        successHandler: ((ResultType?) -> Void)?) {
        execute(parameters: parameters, loadingHandler: {
            loadingPresenter?.beginLoading()
        }, successHandler: { data in
            successHandler?(data)
        }, failureHandler: { error in
            errorAlertPresenter?.handle(error: error)
        }) {
            loadingPresenter?.finishLoading()
        }
    }
}
