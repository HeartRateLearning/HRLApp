//
//  GetHeartRatesInteractor.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

final class GetHeartRatesInteractor {

    // MARK: - Dependencies

    weak var output: GetHeartRatesInteractorOutput!

    var factory: PredictorFactory!
    var workoutStore: WorkoutStoreProtocol!
    var heartRateReader: HeartRateReaderProtocol!
}

// MARK: - GetHeartRatesInteractorInput methods

extension GetHeartRatesInteractor: GetHeartRatesInteractorInput {
    func execute(withWorkoutIndex workoutIndex: Int, dateIndex: Int) {
        guard
            let workout = workoutStore.workout(at: workoutIndex),
            let date = workoutStore.date(at: dateIndex, forWorkoutAt: workoutIndex)
            else {
                output.interactor(self, didFindHeartRates: [])

                return
        }

        let handler: HeartRateReaderProtocol.ResultsHandler = { [weak self] (records) in
            guard let strongSelf = self else {
                return
            }

            let predictor = strongSelf.factory.makePredictor(for: workout)
            strongSelf.appendRecords(records,
                                     toWorkoutAt: workoutIndex,
                                     dateAt: dateIndex,
                                     using: predictor)
            
            strongSelf.ouputAllRecords(forWorkoutAt: workoutIndex, dateAt: dateIndex)
        }

        let mostRecentRecord = workoutStore.mostRecentRecord(forWorkoutAt: workoutIndex,
                                                             dateAt: dateIndex)
        if let startDate = mostRecentRecord?.date {
            heartRateReader.queryRecords(after: startDate,
                                         before: startOfNextDay(for: date),
                                         resultsHandler: handler)
        }
        else {
            heartRateReader.queryRecords(afterOrEqualTo: startOfDay(for: date),
                                         before: startOfNextDay(for: date),
                                         resultsHandler: handler)
        }
    }
}

// MARK: - Private methods

private extension GetHeartRatesInteractor {

    // MARK: - Private methods

    func startOfDay(for date: Date) -> Date {
        let calendar = CalendarFactory.makeDefaultCalendar()

        return calendar.startOfDay(for: date)
    }

    func startOfNextDay(for date: Date) -> Date {
        // NOTICE: 'calendar.date(byAdding: DateComponents(day: 1), to: date)'
        // is available in iOS 10 or above

        let dayInterval = TimeInterval(24 * 60 * 60)
        let nextDate = date.addingTimeInterval(dayInterval)

        return startOfDay(for: nextDate)
    }

    func appendRecords(_ records: [HeartRateRecord],
                       toWorkoutAt workoutIndex: Int,
                       dateAt dateIndex: Int,
                       using predictor: Predictor) {
        for heartRateRecord in records {
            let workingOut = predictor.predictedWorkingOut(for: heartRateRecord)
            let workoutRecord = WorkoutRecord(heartRate: heartRateRecord, workingOut: workingOut)

            workoutStore.appendRecord(workoutRecord, toWorkoutAt: workoutIndex, dateAt: dateIndex)
        }
    }

    func ouputAllRecords(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) {
        var records = [] as [FoundHeartRateRecord]

        let count = workoutStore.recordCount(forWorkoutAt: workoutIndex, dateAt: dateIndex) ?? 0
        for index in 0..<count {
            if let workoutRecord = workoutStore.record(at: index,
                                                       forWorkoutAt: workoutIndex,
                                                       dateAt: dateIndex) {
                let record = FoundHeartRateRecord(date: workoutRecord.date,
                                                  bpm: workoutRecord.bpm,
                                                  workingOut: workoutRecord.workingOut == .true)

                records.append(record)
            }
        }

        output.interactor(self, didFindHeartRates: records)
    }
}
