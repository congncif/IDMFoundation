//
//  BaseXMLMapper.swift
//  Alamofire
//
//  Created by FOLY on 5/30/18.
//

import Foundation
import XMLMapper

extension XMLMappable {
    init?(from data: Any?) {
        guard let data = data else {
            return nil
        }
        if let string = data as? String {
            self.init(XMLString: string)
        } else if let dict = data as? [String: Any] {
            self.init(XML: dict)
        } else {
            return nil
        }
    }
}
