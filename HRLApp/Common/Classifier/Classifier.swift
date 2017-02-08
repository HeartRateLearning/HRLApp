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

    fileprivate var dataFrame = HRLClassifier.DataFrame()
    fileprivate var classifier: HRLClassifier.ClassifierProtocol?

    // MARK: - Init methods

    init(factory: HRLClassifier.ClassifierFactoryProtocol = HRLClassifier.ClassifierFactory()) {
        self.factory = factory
    }
}

// MARK: - TrainerProtocol methods

extension Classifier: TrainerProtocol {
    func fit(record: HeartRateRecord, workingOut: Bool) {
        let hrlRecord = HRLClassifier.Record(date: record.date, bpm: record.bpm)
        dataFrame.append(record: hrlRecord, isWorkingOut: workingOut)

        remakeClassifier()
    }
}

// MARK: - PredictorProtocol methods

extension Classifier: PredictorProtocol {
    func predictedWorkingOut(for record: HeartRateRecord) -> WorkingOut {
        guard let classifier = classifier else {
            return .unknown
        }

        let hrlRecord = HRLClassifier.Record(date: record.date, bpm: record.bpm)
        let prediction = classifier.predictedWorkingOut(for: hrlRecord)

        return WorkingOut(prediction)
    }
}

// MARK: - MementoConvertible methods

extension Classifier: MementoConvertible {
    func makeMemento() -> Data {
        return NSKeyedArchiver.archivedData(withRootObject: dataFrame)
    }

    func setup(withMemento memento: Data) {
        guard let dataFrame = NSKeyedUnarchiver.unarchiveObject(with: memento) as? DataFrame else {
            return
        }

        self.dataFrame = dataFrame

        remakeClassifier()
    }
}

// MARK: - Private body

private extension Classifier {

    // MARK: - Private methods

    func remakeClassifier() {
        classifier = try? factory.makeClassifier(with: dataFrame)
    }
}
