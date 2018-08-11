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
}
