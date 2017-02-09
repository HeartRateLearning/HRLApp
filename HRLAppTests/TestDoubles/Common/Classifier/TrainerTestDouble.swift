//
//  TrainerTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 07/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class TrainerTestDouble {

    // MARK: - Public properties

    fileprivate (set) var fitCount = 0

    fileprivate (set) var lastTrainingData: [TrainerProtocol.TrainingTuple]?
}

// MARK: - TrainerProtocol methods

extension TrainerTestDouble: TrainerProtocol {
    func fit(trainingData: [TrainerProtocol.TrainingTuple]) {
        fitCount += 1

        lastTrainingData = trainingData
    }
}
