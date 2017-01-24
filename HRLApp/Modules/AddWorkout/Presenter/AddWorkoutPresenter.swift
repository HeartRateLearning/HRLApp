//
//  AddWorkoutAddWorkoutPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

// MARK: - Main body

class AddWorkoutPresenter {

    // MARK: - Dependencies

    weak var view: AddWorkoutViewInput!

    var router: AddWorkoutRouterInput!
    var interactor: GetAllWorkoutsInteractorInput!

    // MARK: - Private properties

    fileprivate var workouts = [] as [String]
}

// MARK: - AddWorkoutModuleInput methods

extension AddWorkoutPresenter: AddWorkoutModuleInput {}

// MARK: - AddWorkoutViewOutput methods

extension AddWorkoutPresenter: AddWorkoutViewOutput {
    func viewIsReady() {
        interactor.execute()
    }

    func numberOfWorkouts() -> Int {
        return workouts.count
    }

    func workout(at index: Int) -> String {
        return workouts[index]
    }

    func addWorkout(at index: Int) {
        print("Index: \(index)")
    }
}

// MARK: - GetAllWorkoutsInteractorOutput methods

extension AddWorkoutPresenter: GetAllWorkoutsInteractorOutput {
    func interactor(_ interactor: GetAllWorkoutsInteractorInput, didFind workouts: [String]) {
        self.workouts = workouts

        view.setupInitialState()
    }
}
