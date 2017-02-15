//
//  ClassifierSingleton.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 07/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation
import HRLClassifier

// MARK: - Main body

final class ClassifierSingleton {

    // MARK: - Public properties

    static let sharedInstance = ClassifierSingleton()

    // MARK: - Private properties

    fileprivate var classifier: Classifier

    // MARK: - Init methods

    private init() {
        classifier = Classifier(factory: HRLClassifier.ClassifierFactory())
    }
}

// MARK: - Trainable methods

extension ClassifierSingleton: Trainable {
    func fit(trainingData: [Trainable.TrainingTuple]) {
        classifier.fit(trainingData: trainingData)
    }
}

// MARK: - Predictor methods

extension ClassifierSingleton: Predictor {
    func predictedWorkingOut(for record: HeartRateRecord) -> WorkingOut {
        return classifier.predictedWorkingOut(for: record)
    }
}

// MARK: - MementoConvertible methods

extension ClassifierSingleton: MementoConvertible {
    func makeMemento() -> Data {
        return classifier.makeMemento()
    }

    func setup(withMemento memento: Data) {
        classifier.setup(withMemento: memento)
    }
}
