//
//  GetWorkoutDatesInteractor.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 31/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

final class GetWorkoutDatesInteractor {

    // MARK: - Dependencies

    weak var output: GetWorkoutDatesInteractorOutput!

    var store: WorkoutStoreProtocol!
}

// MARK: - GetWorkoutDatesInteractorInput methods

extension GetWorkoutDatesInteractor: GetWorkoutDatesInteractorInput {
    func execute(withWorkoutIndex index: Int) {
        let workoutDates = dates(forWorkoutAt: index)

        output.interactor(self, didFindWorkoutDates: workoutDates)
    }
}

// MARK: - Private body

private extension GetWorkoutDatesInteractor {
    func dates(forWorkoutAt workoutIndex: Int) -> [Date] {
        let dateCount = store.dateCount(forWorkoutAt: workoutIndex) ?? 0

        var dates = [] as [Date]

        for dateIndex in 0..<dateCount {
            if let date = store.date(at: dateIndex, forWorkoutAt: workoutIndex) {
                dates.append(date)
            }
        }

        return dates
    }
}
