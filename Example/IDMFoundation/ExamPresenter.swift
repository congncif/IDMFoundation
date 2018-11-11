//
//  ExamPresenter.swift
//  IDMFoundation
//
//  Created by FOLY on 11/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import IDMCore
import IDMFoundation
import ViewStateCore

public protocol ExamPresenterProtocol {
	
}

public typealias ExamModelType = ExamService.ResultType
public typealias ExamDataProcessor = DataProcessor<ExamModelType>

public class ExamPresenter: ExamPresenterProtocol {
	public private(set) var state: ExamViewState

    public private(set) var service: ExamService
    public private(set) var processor: ExamDataProcessor

    public init(service: ExamService) {
    	let newState = ExamViewState()
    	state = newState
        self.service = service
        processor = ExamDataHandler(state: newState)
    }
}
