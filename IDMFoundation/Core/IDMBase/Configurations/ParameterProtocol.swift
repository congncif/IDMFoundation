//
//  ParameterProtocol.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 5/30/18.
//

import Foundation
import SiFUtilities

public protocol ParameterProtocol: KeyValueProtocol {
    var parameters: [String: Any] { get }
}
