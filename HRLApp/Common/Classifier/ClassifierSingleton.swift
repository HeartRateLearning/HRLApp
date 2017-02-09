//
//  ClassifierSingleton.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 07/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

final class ClassifierSingleton {

    // MARK: - Public properties

    static let sharedInstance = ClassifierSingleton()

    // MARK: - Private properties

    fileprivate var classifier: Classifier

    // MARK: - Init methods

    private init() {
        classifier = Classifier()
    }
}

// MARK: - TrainerProtocol methods

extension ClassifierSingleton: TrainerProtocol {
    func fit(trainingData: [TrainerProtocol.TrainingTuple]) {
        classifier.fit(trainingData: trainingData)
    }
}

// MARK: - PredictorProtocol methods

extension ClassifierSingleton: PredictorProtocol {
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
