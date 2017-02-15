//
//  CoreDataWorkoutStore.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 14/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import CoreData
import Foundation

// MARK: - Main body

final class CoreDataWorkoutStore {

    // MARK: - Private properties

    fileprivate var root: CoreDataRoot?
    fileprivate let container = NSPersistentContainer(name: Constants.persistentContainerName)
}

// MARK: - CoreDataConfigurable methods

extension CoreDataWorkoutStore: CoreDataConfigurable {
    func setup(completionHandler: @escaping CoreDataConfigurable.CompletionHandler) {
        container.loadPersistentStores { [weak self] (_, error) in
            if error != nil {
                fatalError("Unresolved error \(error)")
            }
            assert(Thread.isMainThread)

            self?.setupWorkoutStore()

            completionHandler()
        }
    }
}

// MARK: - PersistableWorkoutStore methods

extension CoreDataWorkoutStore: PersistableWorkoutStore {
    func workoutCount() -> Int {
        guard let workouts = root?.workouts else {
            return 0
        }

        return workouts.count
    }

    func isWorkoutPersisted(_ workout: Workout) -> Bool {
        guard let workouts = root?.workouts else {
            return false
        }

        return workouts.reduce(false, { (acc, element) -> Bool in
            let coreDataWorkout = element as! CoreDataWorkout

            return acc || Workout(rawValue: Int(coreDataWorkout.workout)) == workout
        })
    }

    func persistedWorkout(at index: Int) -> Workout? {
        guard let workout = coreDataWorkout(at: index)?.workout else {
            return nil
        }

        return Workout(rawValue: Int(workout))
    }

    func appendWorkout(_ workout: Workout) {
        guard let coreDataRoot = root else {
            return
        }

        let context = coreDataRoot.managedObjectContext!

        let coreDataWorkout = CoreDataWorkout(context: context)
        updateCoreDataWorkout(coreDataWorkout, with: workout)

        coreDataRoot.addToWorkouts(coreDataWorkout)

        CoreDataWorkoutStore.saveContext(context)
    }

    func dateCount(forWorkoutAt workoutIndex: Int) -> Int? {
        return coreDataWorkout(at: workoutIndex)?.days!.count
    }

    func isDatePersisted(_ date: Date, forWorkoutAt workoutIndex: Int) -> Bool {
        guard let days = coreDataWorkout(at: workoutIndex)?.days else {
            return false
        }

        return days.reduce(false, { (acc, element) -> Bool in
            let coreDataDate = element as! CoreDataDate

            return acc || coreDataDate.date as! Date == date
        })
    }

    func persistedDate(at index: Int, forWorkoutAt workoutIndex: Int) -> Date? {
        return coreDataDate(at: index, forWorkoutAt: workoutIndex)?.date as? Date
    }

    func appendDate(_ date: Date, toWorkoutAt workoutIndex: Int) {
        guard let coreDataWorkout = coreDataWorkout(at: workoutIndex) else {
            return
        }

        let context = coreDataWorkout.managedObjectContext!

        let coreDataDate = CoreDataDate(context: context)
        updateCoreDataDate(coreDataDate, with: date)

        coreDataWorkout.addToDays(coreDataDate)

        CoreDataWorkoutStore.saveContext(context)
    }

    func recordCount(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> Int? {
        return coreDataDate(at: dateIndex, forWorkoutAt: workoutIndex)?.records!.count
    }

    func persistedRecord(at index: Int,
                         forWorkoutAt workoutIndex: Int,
                         dateAt dateIndex: Int) -> WorkoutRecord? {
        return coreDataRecord(at: index, forWorkoutAt: workoutIndex, dateAt: dateIndex)
    }

    func appendRecord(_ record: WorkoutRecord,
                      toWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int) {
        guard let coreDataDate = coreDataDate(at: dateIndex, forWorkoutAt: workoutIndex) else {
            return
        }

        let context = coreDataDate.managedObjectContext!

        let coreDataRecord = CoreDataRecord(context: context)
        updateCoreDataRecord(coreDataRecord, with: record)

        coreDataDate.addToRecords(coreDataRecord)

        CoreDataWorkoutStore.saveContext(context)
    }

    func insertRecord(_ record: WorkoutRecord,
                      intoWorkoutAt workoutIndex: Int,
                      dateAt dateIndex: Int,
                      recordAt recordIndex: Int) {
        guard let coreDataDate = coreDataDate(at: dateIndex, forWorkoutAt: workoutIndex) else {
            return
        }

        guard recordIndex < coreDataDate.records!.count else {
            return
        }

        let context = coreDataDate.managedObjectContext!

        let coreDataRecord = CoreDataRecord(context: context)
        updateCoreDataRecord(coreDataRecord, with: record)

        coreDataDate.insertIntoRecords(coreDataRecord, at: recordIndex)

        CoreDataWorkoutStore.saveContext(context)
    }

    func mostRecentRecord(forWorkoutAt workoutIndex: Int, dateAt dateIndex: Int) -> WorkoutRecord? {
        guard let records = coreDataDate(at: dateIndex, forWorkoutAt: workoutIndex)?.records else {
            return nil
        }

        return records.reduce(nil, { (current, next) -> WorkoutRecord? in
            guard let currentRecord = current else {
                return makeRecord(with: next as! CoreDataRecord)
            }

            let nextRecord = next as! CoreDataRecord
            let nextDate = nextRecord.date as! Date

            return currentRecord.date < nextDate ? makeRecord(with: nextRecord) : current
        })
    }
}

// MARK: - Private body

private extension CoreDataWorkoutStore {

    // MARK: - Constants

    enum Constants {
        static let persistentContainerName = "WorkoutStore"
    }

    // MARK: - Private methods

    func setupWorkoutStore() {
        let context = container.viewContext

        root = CoreDataWorkoutStore.persistedRoot(in: context)
        if root == nil {
            root = CoreDataWorkoutStore.appendRoot(in: context)
        }
    }

    func updateCoreDataWorkout(_ coreDataWorkout: CoreDataWorkout, with workout: Workout) {
        coreDataWorkout.workout = Int32(workout.rawValue)
    }

    func updateCoreDataDate(_ coreDataDate: CoreDataDate, with date: Date) {
        coreDataDate.date = date as NSDate
    }

    func makeRecord(with coreDataRecord: CoreDataRecord) -> WorkoutRecord {
        let heartRate = HeartRateRecord(date: coreDataRecord.date as! Date, bpm: coreDataRecord.bpm)
        let workingOut = WorkingOut(rawValue: Int(coreDataRecord.workingOut))!

        return WorkoutRecord(heartRate: heartRate, workingOut: workingOut)
    }

    func updateCoreDataRecord(_ coreDataRecord: CoreDataRecord, with record: WorkoutRecord) {
        coreDataRecord.bpm = record.bpm
        coreDataRecord.date = record.date as NSDate
        coreDataRecord.workingOut = Int32(record.workingOut.rawValue)
    }

    func coreDataWorkout(at index: Int) -> CoreDataWorkout? {
        guard let workouts = root?.workouts else {
            return nil
        }

        guard index < workouts.count else {
            return nil
        }

        return workouts[index] as? CoreDataWorkout
    }

    func coreDataDate(at index: Int, forWorkoutAt workoutIndex: Int) -> CoreDataDate? {
        guard let days = coreDataWorkout(at: workoutIndex)?.days else {
            return nil
        }

        guard index < days.count else {
            return nil
        }

        return days[index] as? CoreDataDate
    }

    func coreDataRecord(at index: Int,
                        forWorkoutAt workoutIndex: Int,
                        dateAt dateIndex: Int) -> WorkoutRecord? {
        guard let records = coreDataDate(at: dateIndex, forWorkoutAt: workoutIndex)?.records else {
            return nil
        }

        guard index < records.count else {
            return nil
        }

        return makeRecord(with: records[index] as! CoreDataRecord)
    }

    // MARK: - Private class methods

    static func persistedRoot(in context: NSManagedObjectContext) -> CoreDataRoot? {
        var roots = [] as [CoreDataRoot]

        do {
            roots = try context.fetch(CoreDataRoot.fetchRequest())
        }
        catch {
            fatalError("Unresolved error \(error)")
        }

        return roots.first
    }

    static func appendRoot(in context: NSManagedObjectContext) -> CoreDataRoot {
        let root = CoreDataRoot(context: context)
        CoreDataWorkoutStore.saveContext(context)

        return root
    }

    static func saveContext(_ context: NSManagedObjectContext) {
        guard context.hasChanges else {
            return
        }

        do {
            try context.save()
        }
        catch {
            fatalError("Unresolved error \(error)")
        }
    }
}
