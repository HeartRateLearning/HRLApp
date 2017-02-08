//
//  AddWorkoutAddWorkoutPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

final class AddWorkoutPresenter {

    // MARK: - Dependencies

    weak var view: AddWorkoutViewInput!
    weak var router: AddWorkoutRouterInput!

    var getAllWorkouts: GetAllWorkoutsInteractorInput!
    var storeWorkout: StoreWorkoutInteractorInput!
}

// MARK: - AddWorkoutModuleInput methods

extension AddWorkoutPresenter: AddWorkoutModuleInput {}

// MARK: - AddWorkoutViewOutput methods

extension AddWorkoutPresenter: AddWorkoutViewOutput {
    func viewIsReady() {
        getAllWorkouts.execute()
    }

    func addWorkout(at index: Int, startingOn date: Date) {
        storeWorkout.execute(withWorkoutIndex: index, startingOn: date)
    }
}

// MARK: - GetAllWorkoutsInteractorOutput methods

extension AddWorkoutPresenter: GetAllWorkoutsInteractorOutput {
    func interactor(_ interactor: GetAllWorkoutsInteractorInput,
                    didFindWorkouts workouts: [String]) {
        view.setup(with: workouts)
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
