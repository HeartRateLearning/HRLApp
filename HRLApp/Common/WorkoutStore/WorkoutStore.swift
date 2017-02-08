//
//  WorkoutStore.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

final class WorkoutStore {

    // MARK: - WorkoutStoreProtocol properties

    weak var delegate: WorkoutStoreDelegate?

    // MARK: - Private properties

    fileprivate var workouts = [] as [StoredWorkout]
}

// MARK: - WorkoutStoreProtocol methods

extension WorkoutStore: WorkoutStoreProtocol {
    func workoutCount() -> Int {
        return workouts.count
    }

    func workout(at index: Int) -> Workout? {
        return storedWorkout(at: index)?.workout
    }

    func appendWorkout(_ workout: Workout) {
        workouts.append(StoredWorkout(workout: workout))

        delegate?.workoutStore(self, didAppendWorkoutAtIndex: workouts.count - 1)
    }

    func dateCount(forWorkoutAt workoutIndex: Int) -> Int? {
        return storedWorkout(at: workoutIndex)?.dates.count
    }

    func date(at index: Int, forWorkoutAt workoutIndex: Int) -> Date? {
        return storedDate(at: index, forWorkoutAt: workoutIndex)?.date
    }

    func appendDate(_ date: Date, toWorkoutAt workoutIndex: Int) {
        storedWorkout(at: workoutIndex)?.dates.append(StoredDate(date: date))
    }

    func recordCount(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> Int? {
        return storedDate(at: dateIndex, forWorkoutAt: workoutIndex)?.records.count
    }

    func record(at index: Int,
                forWorkoutAt workoutIndex: Int,
                dateAt dateIndex: Int) -> WorkoutRecord? {
        guard let records = storedDate(at: dateIndex, forWorkoutAt: workoutIndex)?.records else {
            return nil
        }

        guard index < records.count else {
            return nil
        }

        return records[index]
    }

    func appendRecord(_ record: WorkoutRecord,
                      toWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int) {
        guard let date = storedDate(at: dateIndex, forWorkoutAt: workoutIndex) else {
            return
        }

        if workoutRecord(record, isMostRecentRecordIn: date) {
            date.mostRecentRecord = record
        }

        date.records.append(record)
    }

    func insertRecord(_ record: WorkoutRecord,
                      intoWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int,
                      recordAt recordIndex: Int) {
        guard let date = storedDate(at: dateIndex, forWorkoutAt: workoutIndex) else {
            return
        }

        guard recordIndex < date.records.count else {
            return
        }

        if workoutRecord(record, isMostRecentRecordIn: date) {
            date.mostRecentRecord = record
        }

        date.records[recordIndex] = record
    }

    func mostRecentRecord(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> WorkoutRecord? {
        return storedDate(at: dateIndex, forWorkoutAt: workoutIndex)?.mostRecentRecord
    }
}

// MARK: - Private body

private extension WorkoutStore {

    // MARK: - Type definitions

    final class StoredDate {
        let date: Date
        var records: [WorkoutRecord]
        var mostRecentRecord: WorkoutRecord?

        init(date: Date) {
            self.date = date

            records = []
            mostRecentRecord = nil
        }
    }

    final class StoredWorkout {
        let workout: Workout
        var dates: [StoredDate]

        init(workout: Workout) {
            self.workout = workout

            dates = []
        }
    }

    // MARK: - Private methods

    func storedWorkout(at index: Int) -> StoredWorkout? {
        guard index < workouts.count else {
            return nil
        }

        return workouts[index]
    }

    func storedDate(at index: Int, forWorkoutAt workoutIndex: Int) -> StoredDate? {
        guard let dates = storedWorkout(at: workoutIndex)?.dates else {
            return nil
        }

        guard index < dates.count else {
            return nil
        }

        return dates[index]
    }

    func workoutRecord(_ record: WorkoutRecord, isMostRecentRecordIn date: StoredDate) -> Bool {
        let heartRateDate = record.date
        let mostRecentHeartRateDate = date.mostRecentRecord?.date

        return mostRecentHeartRateDate == nil || mostRecentHeartRateDate! < heartRateDate
    }
}
