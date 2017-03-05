//
//  PredictorFactoryTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 17/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class PredictorFactoryTestDouble {

    // MARK: - Public properties

    fileprivate (set) var makePredictorCount = 0

    var makePredictorResult = PredictorTestDouble()
}

// MARK: - PredictorFactory methods

extension PredictorFactoryTestDouble: PredictorFactory {
    func makePredictor(workout: Workout) -> Predictor {
        makePredictorCount += 1

        return makePredictorResult
    }
}
