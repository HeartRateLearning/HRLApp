//
//  GetStoredWorkoutsInteractor.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 23/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

class GetStoredWorkoutsInteractor {

    // MARK: - Dependencies

    weak var output: GetStoredWorkoutsInteractorOutput!

    var store: WorkoutStoreProtocol!
}

// MARK: - GetStoredWorkoutsInteractorInput methods

extension GetStoredWorkoutsInteractor: GetStoredWorkoutsInteractorInput {
    func execute() {
        output.interactor(self, didFindWorkouts: storedWorkouts())
    }
}

// MARK: - WorkoutStoreDelegate methods

extension GetStoredWorkoutsInteractor: WorkoutStoreDelegate {
    func workoutStore(_ store: WorkoutStoreProtocol, didAppendWorkoutAtIndex index: Int) {
        output.interactor(self, didFindWorkouts: storedWorkouts())
    }
}

// MARK: - Private body

private extension GetStoredWorkoutsInteractor {
    func storedWorkouts() -> [String] {
        var workouts = [] as [String]

        for index in 0..<store.workoutCount() {
            let workout = store.workout(at: index)

            workouts.append(String(workout))
        }

        return workouts
    }
}
