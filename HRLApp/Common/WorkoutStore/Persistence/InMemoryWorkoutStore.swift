//
//  InMemoryWorkoutStore.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 12/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

final class InMemoryWorkoutStore {

    // MARK: - Type definitions

    final class InMemoryDate {

        // MARK: - PersistableDate properties

        let date: Date

        // MARK: - Private properties

        fileprivate var records: [WorkoutRecord]

        // MARK: - Init methods

        init(_ date: Date) {
            self.date = date

            records = []
        }
    }

    final class InMemoryWorkout {

        // MARK: - PersistableWorkout properties

        let workout: Workout

        // MARK: - Private properties
        
        fileprivate var dates: [InMemoryDate]

        // MARK: - Init methods

        init(_ workout: Workout) {
            self.workout = workout
            
            dates = []
        }
    }

    // MARK: - Private properties

    fileprivate var workouts = [] as [InMemoryWorkout]
}

// MARK: - PersistableWorkoutStore methods

extension InMemoryWorkoutStore: PersistableWorkoutStore {
    func workoutCount() -> Int {
        return workouts.count
    }

    func isWorkoutPersisted(_ workout: Workout) -> Bool {
        return workouts.reduce(false, { $0 || $1.workout == workout })
    }

    func persistedWorkout(at index: Int) -> Workout? {
        return inMemoryWorkout(at: index)?.workout
    }

    func appendWorkout(_ workout: Workout) {
        let inMemoryWorkout = InMemoryWorkout(workout)

        workouts.append(inMemoryWorkout)
    }

    func dateCount(forWorkoutAt workoutIndex: Int) -> Int? {
        return inMemoryWorkout(at: workoutIndex)?.dates.count
    }

    func isDatePersisted(_ date: Date, forWorkoutAt workoutIndex: Int) -> Bool {
        guard let dates = inMemoryWorkout(at: workoutIndex)?.dates else {
            return false
        }

        return dates.reduce(false, { $0 || $1.date == date})
    }

    func persistedDate(at index: Int, forWorkoutAt workoutIndex: Int) -> Date? {
        return inMemoryDate(at: index, forWorkoutAt: workoutIndex)?.date
    }

    func appendDate(_ date: Date, toWorkoutAt workoutIndex: Int) {
        let inMemoryDate = InMemoryDate(date)

        inMemoryWorkout(at: workoutIndex)?.dates.append(inMemoryDate)
    }

    func recordCount(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> Int? {
        return inMemoryDate(at: dateIndex, forWorkoutAt: workoutIndex)?.records.count
    }

    func persistedRecord(at index: Int,
                         forWorkoutAt workoutIndex: Int,
                         dateAt dateIndex: Int) -> WorkoutRecord? {
        return inMemoryRecord(at: index, forWorkoutAt: workoutIndex, dateAt: dateIndex)
    }

    func appendRecord(_ record: WorkoutRecord,
                      toWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int) {
        guard let date = inMemoryDate(at: dateIndex, forWorkoutAt: workoutIndex) else {
            return
        }

        date.records.append(record)
    }

    func replaceRecord(at index: Int,
                       forWorkoutAt workoutIndex: Int,
                       dateAt dateIndex: Int,
                       with record: WorkoutRecord) {
        guard
            let date = inMemoryDate(at: dateIndex, forWorkoutAt: workoutIndex),
            index < date.records.count
            else {
                return
        }

        date.records[index] = record
    }

    func mostRecentRecord(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> WorkoutRecord? {
        guard let date = inMemoryDate(at: dateIndex, forWorkoutAt: workoutIndex) else {
            return nil
        }

        return date.records.reversed().reduce(nil, { (current, next) -> WorkoutRecord? in
            guard let current = current else {
                return next
            }

            return current.date < next.date ? next : current
        })
    }
}

// MARK: - Private body

private extension InMemoryWorkoutStore {

    // MARK: - Private methods

    func inMemoryWorkout(at index: Int) -> InMemoryWorkout? {
        guard index < workouts.count else {
            return nil
        }

        return workouts[index]
    }

    func inMemoryDate(at index: Int, forWorkoutAt workoutIndex: Int) -> InMemoryDate? {
        guard let dates = inMemoryWorkout(at: workoutIndex)?.dates, index < dates.count else {
            return nil
        }

        return dates[index]
    }

    func inMemoryRecord(at index: Int,
                        forWorkoutAt workoutIndex: Int,
                        dateAt dateIndex: Int) -> WorkoutRecord? {
        guard
            let records = inMemoryDate(at: dateIndex, forWorkoutAt: workoutIndex)?.records,
            index < records.count
            else {
                return nil
        }

        return records[index]
    }
}
