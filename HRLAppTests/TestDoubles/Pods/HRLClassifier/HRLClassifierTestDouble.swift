//
//  HRLClassifierTestDouble.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 08/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation
import HRLClassifier

// MARK: - Main body

final class HRLClassifierTestDouble {

    // MARK: - Public properties

    fileprivate (set) var predictedWorkingOutCount = 0

    fileprivate (set) var lastPredictedWorkingOutRecord: HRLClassifier.Record?

    var predictedWorkingOutResult = false
}

// MARK: - HRLClassifier.ClassifierProtocol methods

extension HRLClassifierTestDouble: HRLClassifier.ClassifierProtocol {
    func predictedWorkingOut(for record: HRLClassifier.Record) -> Bool {
        predictedWorkingOutCount += 1

        lastPredictedWorkingOutRecord = record

        return predictedWorkingOutResult
    }
}
