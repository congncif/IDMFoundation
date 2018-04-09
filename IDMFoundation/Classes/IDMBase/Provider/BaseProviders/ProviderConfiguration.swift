//
//  ProviderConfiguration.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 3/8/18.
//

import Foundation

public class ProviderConfiguration {
    public static let shared = ProviderConfiguration()

    private init() {
    }

    public var headerFields: [String: String]?
    public var credential: URLCredential?
}
