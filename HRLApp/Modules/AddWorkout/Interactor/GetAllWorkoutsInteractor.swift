//
//  GetAllWorkoutsInteractor.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 23/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

class GetAllWorkoutsInteractor {

    // MARK: - Dependencies

    weak var output: GetAllWorkoutsInteractorOutput!
}

// MARK: - GetAllWorkoutsInteractorInput methods

extension GetAllWorkoutsInteractor: GetAllWorkoutsInteractorInput {
    func execute() {
        var workouts = [] as [String]

        for workout in Workout.americanFootball {
            workouts.append(String(workout))
        }

        output.interactor(self, didFind: workouts)
    }
}
