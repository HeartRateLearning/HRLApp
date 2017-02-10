//
//  PredictorTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 07/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

@testable import HRLApp

// MARK: - Main body

final class PredictorTestDouble {

    // MARK: - Public properties

    fileprivate (set) var predictedCount = 0

    fileprivate (set) var lastPredictedRecord: HeartRateRecord?

    var predictedResult = WorkingOut.unknown
}

// MARK: - Predictor methods

extension PredictorTestDouble: Predictor {
    func predictedWorkingOut(for record: HeartRateRecord) -> WorkingOut {
        predictedCount += 1

        lastPredictedRecord = record

        return predictedResult
    }
}
