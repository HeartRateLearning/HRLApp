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
    func execute(withWorkoutIndex index: Int, startingOn date: Date) {
        guard let workout = Workout(rawValue: index) else {
            output.interactor(self, didFailToStoreWorkoutWithIndex: index)

            return
        }

        store.appendWorkout(workout)

        let workoutIndex = store.workoutCount() - 1
        appendDates(startingOn: date, toWorkoutAtIndex: workoutIndex)

        output.interactor(self, didStoreWorkout: String(workout))
    }
}

// MARK: - Private body

private extension StoreWorkoutInteractor {

    // MARK: - Constants

    enum Constants {
        static let dayInterval = TimeInterval(24 * 60 * 60)
    }

    // MARK: - Private methods

    func appendDates(startingOn date: Date, toWorkoutAtIndex index: Int) {
        let calendar = CalendarFactory.makeDefaultCalendar()

        var nextDate = calendar.startOfDay(for: date)
        let endDate = calendar.startOfDay(for: Date())

        while nextDate <= endDate {
            store.appendDate(nextDate, toWorkoutAt: index)

            nextDate.addTimeInterval(Constants.dayInterval)
        }
    }
}
