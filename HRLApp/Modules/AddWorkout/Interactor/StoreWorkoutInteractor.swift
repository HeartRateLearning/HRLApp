//
//  StoreWorkoutInteractor.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 24/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

class StoreWorkoutInteractor {

    // MARK: - Dependencies

    weak var output: StoreWorkoutInteractorOutput!

    var store: WorkoutStoreProtocol!
}

// MARK: - StoreWorkoutInteractorInput methods

extension StoreWorkoutInteractor: StoreWorkoutInteractorInput {
    func execute(withWorkoutIndex index: Int) {
        guard let workout = Workout(rawValue: index) else {
            output.interactor(self, didFailToStoreWorkoutWithIndex: index)

            return
        }

        store.appendWorkout(workout)

        output.interactor(self, didStoreWorkout: String(workout))
    }
}
