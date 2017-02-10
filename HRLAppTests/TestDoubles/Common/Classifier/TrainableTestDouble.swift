//
//  TrainableTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 07/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class TrainableTestDouble {

    // MARK: - Public properties

    fileprivate (set) var fitCount = 0

    fileprivate (set) var lastTrainingData: [Trainable.TrainingTuple]?
}

// MARK: - Trainable methods

extension TrainableTestDouble: Trainable {
    func fit(trainingData: [Trainable.TrainingTuple]) {
        fitCount += 1

        lastTrainingData = trainingData
    }
}
