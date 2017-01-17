//
//  ListWorkoutsListWorkoutsInteractor.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

// MARK: - Public body

class ListWorkoutsInteractor {

    // MARK: - Dependencies

    weak var output: ListWorkoutsInteractorOutput!

    var store: WorkoutStoreProtocol!
}

// MARK: - ListWorkoutsInteractorInput methods

extension ListWorkoutsInteractor: ListWorkoutsInteractorInput {
    func execute() {
        output.foundWorkouts(store.workouts)
    }
}
