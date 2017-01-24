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
}

// MARK: - AddWorkoutModuleInput methods

extension AddWorkoutPresenter: AddWorkoutModuleInput {}

// MARK: - AddWorkoutViewOutput methods

extension AddWorkoutPresenter: AddWorkoutViewOutput {
    func viewIsReady() {}
}

// MARK: - GetAllWorkoutsInteractorOutput methods

extension AddWorkoutPresenter: GetAllWorkoutsInteractorOutput {
    func interactor(_ interactor: GetAllWorkoutsInteractorInput, didFind workouts: [String]) {}
}
