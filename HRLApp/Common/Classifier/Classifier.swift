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

final class Classifier {

    // MARK: - Private properties

    fileprivate let factory: HRLClassifier.ClassifierFactoryProtocol
    fileprivate let dataFrameStore: DataFramePersistentStoreProtocol

    fileprivate var classifier: HRLClassifier.ClassifierProtocol?

    // MARK: - Init methods

    init(factory: HRLClassifier.ClassifierFactoryProtocol,
         dataFrameStore: DataFramePersistentStoreProtocol) {
        self.factory = factory
        self.dataFrameStore = dataFrameStore
    }
}

// MARK: - Trainable methods

extension Classifier: Trainable {
    func fit(trainingData: [Trainable.TrainingTuple]) {
        let updatedDataFrame = updatePersistedDataFrame(with: trainingData)

        classifier = try? factory.makeClassifier(with: updatedDataFrame)
    }
}

// MARK: - Predictor methods

extension Classifier: Predictor {
    func predictedWorkingOut(for record: HeartRateRecord) -> WorkingOut {
        guard let classifier = classifier else {
            return .unknown
        }

        let hrlRecord = HRLClassifier.Record(date: record.date, bpm: record.bpm)
        let prediction = classifier.predictedWorkingOut(for: hrlRecord)

        return WorkingOut(prediction)
    }
}

// MARK: - Private body

private extension Classifier {

    // MARK: - Private methods

    func updatePersistedDataFrame(with trainingData: [Trainable.TrainingTuple]) -> DataFrame {
        let dataFrame = dataFrameStore.read()

        for (record, workingOut) in trainingData {
            let hrlRecord = HRLClassifier.Record(date: record.date, bpm: record.bpm)

            dataFrame.append(record: hrlRecord, isWorkingOut: workingOut)
        }

        dataFrameStore.write(dataFrame)

        return dataFrame
    }
}
