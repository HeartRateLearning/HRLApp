//
//  ListWorkoutsListWorkoutsInteractor.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

// MARK: - Main body

class ListWorkoutsInteractor {

    // MARK: - Dependencies

    weak var output: ListWorkoutsInteractorOutput!

    var store: WorkoutStoreProtocol!
}

// MARK: - ListWorkoutsInteractorInput methods

extension ListWorkoutsInteractor: ListWorkoutsInteractorInput {
    func execute() {
        var workouts = [] as [String]

        for index in 0..<store.workoutCount() {
            workouts.append(store.workout(at: index).rawValue)
        }

        output.interactor(self, didFind: workouts)
    }
}
