//
//  TestSegue.swift
//  IDMFoundation
//
//  Created by NGUYEN CHI CONG on 12/15/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

final class TestSegue: UIStoryboardSegue {}

extension TestSegue {
	public override func perform() {
        super.perform()
    }
}

extension TestSegue {
//	var target: <#TargetModuleInterface#>? {
//		return destination as? <#TargetModuleInterface#>
//  }

    var current: TestModuleInterface? {
        return source as? TestModuleInterface
    }
}