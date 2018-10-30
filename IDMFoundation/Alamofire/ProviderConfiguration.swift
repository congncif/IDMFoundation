//
//  ProviderConfiguration.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 3/8/18.
//
import Alamofire
import Foundation

public class ProviderConfiguration {
    public static let shared = ProviderConfiguration()

    private init() {
    }

    public var headerFields: [String: String]?
    public var credential: URLCredential?
    public var customRequest: ((Request) -> Void)?
    public var customURLRequest: ((URLRequest) -> URLRequest)?
    public var logger: ProviderLogger = ProviderLogger()
}

public protocol ProviderLoggerProtocol {
    var isLoggerEnabled: Bool { get }

    func logRequest(title: String, path: String, parameters: [String: Any]?)

    func logDataResponse(_ response: DataResponse<Any>?)
    func logDownloadResponse<Value>(_ response: DownloadResponse<Value>?)
    func logDownloadResponse(_ response: DefaultDownloadResponse?)
}

open class ProviderLogger: ProviderLoggerProtocol {
    public var isLoggerEnabled: Bool = true

    open func logDataResponse(_ response: DataResponse<Any>?) {
        print("🌷 Response: \(String(describing: response?.value))")
        if let error = response?.error {
            print("🥀 Error: " + String(describing: error))
        }
    }

    open func logRequest(title: String = "Request", path: String, parameters: [String: Any]?) {
        print("📦 \(title): " + path)
        let param = String(describing: parameters)
        print("🌿 Parameters: \(param)")
    }

    open func logDownloadResponse<Value>(_ response: DownloadResponse<Value>?) {
        print("🌷 Response: \(String(describing: response?.value))")
        if let err = response?.error {
            print("🥀 Error: " + String(describing: err))
        }
    }

    open func logDownloadResponse(_ response: DefaultDownloadResponse?) {
        print("🌷 Downloaded file: \(String(describing: response?.destinationURL))")
        if let err = response?.error {
            print("🥀 Error: " + String(describing: err))
        }
    }
}
