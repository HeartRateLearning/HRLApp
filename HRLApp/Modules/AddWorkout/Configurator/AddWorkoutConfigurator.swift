//
//  AddWorkoutAddWorkoutConfigurator.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 18/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

final class AddWorkoutModuleConfigurator {

    // MARK: - Public methods

    func configureDependencies(for viewInput: UIViewController, with store: WorkoutStoreProtocol) {
        guard let viewController = viewInput as? AddWorkoutViewController else {
            return
        }

        configureDependencies(for: viewController, with: store)
    }
}

// MARK: - Private body

private extension AddWorkoutModuleConfigurator {

    // MARK: - Private methods

    func configureDependencies(for viewController: AddWorkoutViewController,
                               with store: WorkoutStoreProtocol) {
        let presenter = AddWorkoutPresenter()
        presenter.view = viewController
        presenter.router = viewController

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
