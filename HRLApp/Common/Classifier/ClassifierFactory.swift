//
//  ClassifierFactory.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 16/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation
import HRLClassifier

// MARK: - Main body

final class ClassifierFactory {}

// MARK: - PredictorFactory methods

extension ClassifierFactory: PredictorFactory {
    func makePredictor(for workout: Workout) -> Predictor {
        return makeClassifier(for: workout)
    }
}

// MARK: - TrainableFactory methods

extension ClassifierFactory: TrainableFactory {
    func makeTrainable(for workout: Workout) -> Trainable {
        return makeClassifier(for: workout)
    }
}

// MARK: - Private extension

private extension ClassifierFactory {

    // MARK: - Private methods

    func makeClassifier(for workout: Workout) -> Classifier {
        let factory = HRLClassifier.ClassifierFactory()
        let dataFrameStore = DataFramePersistentStore(workout: workout)

        return Classifier(factory: factory, dataFrameStore: dataFrameStore)
    }
}
