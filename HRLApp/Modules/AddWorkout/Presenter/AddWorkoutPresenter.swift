//
//  AddWorkoutAddWorkoutPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

class AddWorkoutPresenter {

    // MARK: - Dependencies

    weak var view: AddWorkoutViewInput!

    var router: AddWorkoutRouterInput!
    var getAllWorkouts: GetAllWorkoutsInteractorInput!
    var storeWorkout: StoreWorkoutInteractorInput!

    // MARK: - Private properties

    fileprivate var workouts = [] as [String]
}

// MARK: - AddWorkoutModuleInput methods

extension AddWorkoutPresenter: AddWorkoutModuleInput {}

// MARK: - AddWorkoutViewOutput methods

extension AddWorkoutPresenter: AddWorkoutViewOutput {
    func viewIsReady() {
        getAllWorkouts.execute()
    }

    func numberOfWorkouts() -> Int {
        return workouts.count
    }

    func workout(at index: Int) -> String {
        return workouts[index]
    }

    func addWorkout(at index: Int) {
        storeWorkout.execute(withWorkoutIndex: index, startingOn: Date())
    }
}

// MARK: - GetAllWorkoutsInteractorOutput methods

extension AddWorkoutPresenter: GetAllWorkoutsInteractorOutput {
    func interactor(_ interactor: GetAllWorkoutsInteractorInput,
                    didFindWorkouts workouts: [String]) {
        self.workouts = workouts

        view.setupInitialState()
    }
}

extension AddWorkoutPresenter: StoreWorkoutInteractorOutput {
    func interactor(_ interactor: StoreWorkoutInteractorInput, didStoreWorkout workout: String) {
        router.presentWorkoutList()
    }

    func interactor(_ interactor: StoreWorkoutInteractorInput,
                    didFailToStoreWorkoutWithIndex index: Int) {
        print("AddWorkoutPresenter: StoreWorkoutInteractor: didFailToStoreWorkoutWithIndex: \(index)")
    }
}
