//
//  Classifier.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 07/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation
import HRLClassifier

// MARK: - Main body

class Classifier {

    // MARK: - Private properties

    fileprivate let hrlFactory: HRLClassifier.ClassifierFactoryProtocol
    fileprivate let hrlDataFrame: HRLClassifier.DataFrame

    fileprivate var hrlClassifier: HRLClassifier.ClassifierProtocol?

    // MARK: - Init methods

    init() {
        hrlFactory = HRLClassifier.ClassifierFactory()
        hrlDataFrame = HRLClassifier.DataFrame()
    }
}

// MARK: - TrainerProtocol methods

extension Classifier: TrainerProtocol {
    func fit(record: HeartRateRecord, workingOut: Bool) {
        let hrlRecord = HRLClassifier.Record(date: record.date, bpm: record.bpm)
        hrlDataFrame.append(record: hrlRecord, isWorkingOut: workingOut)

        hrlClassifier = try? hrlFactory.makeClassifier(with: hrlDataFrame)
    }
}

// MARK: - PredictorProtocol methods

extension Classifier: PredictorProtocol {
    func predictedWorkingOut(for record: HeartRateRecord) -> WorkingOut {
        guard let hrlClassifier = hrlClassifier else {
            return .unknown
        }

        let hrlRecord = HRLClassifier.Record(date: record.date, bpm: record.bpm)
        let prediction = hrlClassifier.predictedWorkingOut(for: hrlRecord)

        return WorkingOut(prediction)
    }
}
