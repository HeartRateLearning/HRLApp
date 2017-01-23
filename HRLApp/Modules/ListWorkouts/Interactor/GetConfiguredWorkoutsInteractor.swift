//
//  GetConfiguredWorkoutsInteractor.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 23/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

class GetConfiguredWorkoutsInteractor {

    // MARK: - Dependencies

    weak var output: GetConfiguredWorkoutsInteractorOutput!

    var store: WorkoutStoreProtocol!
}

// MARK: - GetConfiguredWorkoutsInteractorInput methods

extension GetConfiguredWorkoutsInteractor: GetConfiguredWorkoutsInteractorInput {
    func execute() {
        var workouts = [] as [String]

        for index in 0..<store.workoutCount() {
            let workout = store.workout(at: index)

            workouts.append(String(workout))
        }

        output.interactor(self, didFind: workouts)
    }
}
