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
    func makePredictor(workout: Workout) -> Predictor {
        return makeClassifier(workout: workout)
    }
}

// MARK: - TrainableFactory methods

extension ClassifierFactory: TrainableFactory {
    func makeTrainable(workout: Workout) -> Trainable {
        return makeClassifier(workout: workout)
    }
}

// MARK: - Private extension

private extension ClassifierFactory {

    // MARK: - Private methods

    func makeClassifier(workout: Workout) -> Classifier {
        let factory = HRLClassifier.ClassifierFactory()
        let dataFrameStore = DataFramePersistentStore(workout: workout)

        return Classifier(factory: factory, dataFrameStore: dataFrameStore)
    }
}
