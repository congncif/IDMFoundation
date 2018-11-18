//
//  ResponseModelConfiguration.swift
//  IDMFoundation
//
//  Created by FOLY on 3/14/18.
//

import Foundation

public class ResponseModelConfiguration {
    public static let shared = ResponseModelConfiguration()
    
    private init() {}
    
    public var validator: ((_ model: ResponseModelProtocol) -> Error?)?
}
