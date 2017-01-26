//
//  AddWorkoutAddWorkoutConfigurator.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

class AddWorkoutModuleConfigurator {

    // MARK: - Public methods

    func configureModule(for viewInput: UIViewController) {
        guard let viewController = viewInput as? AddWorkoutViewController else {
            return
        }

        configure(viewController)
    }
}

// MARK: - Private body

private extension AddWorkoutModuleConfigurator {
    func configure(_ viewController: AddWorkoutViewController) {
        let store = WorkoutStoreSingleton.sharedInstance

        let router = AddWorkoutRouter()
        router.viewController = viewController

        let presenter = AddWorkoutPresenter()
        presenter.view = viewController
        presenter.router = router

        let getAllWorkouts = GetAllWorkoutsInteractor()
        getAllWorkouts.output = presenter

        let storeWorkout = StoreWorkoutInteractor()
        storeWorkout.store = store
        storeWorkout.output = presenter

        presenter.getAllWorkouts = getAllWorkouts
        presenter.storeWorkout = storeWorkout
        viewController.output = presenter
    }
}
