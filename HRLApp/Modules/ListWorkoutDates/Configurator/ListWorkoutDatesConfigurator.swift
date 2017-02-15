//
//  ListWorkoutDatesListWorkoutDatesConfigurator.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

final class ListWorkoutDatesModuleConfigurator {

    // MARK: - Public methods

    func configureDependencies(for viewInput: UIViewController, with store: WorkoutStoreProtocol) {
        guard let viewController = viewInput as? ListWorkoutDatesViewController else {
            return
        }

        configureDependencies(for: viewController, with: store)
    } 

    func configureModule(for viewInput: UIViewController, withWorkoutAt index: Int) {
        guard let viewController = viewInput as? ListWorkoutDatesViewController else {
            return
        }

        configureModule(for: viewController, withWorkoutAt: index)
    }
}

// MARK: - Private body

private extension ListWorkoutDatesModuleConfigurator {

    // MARK: - Private methods

    func configureDependencies(for viewController: ListWorkoutDatesViewController,
                               with store: WorkoutStoreProtocol) {
        let presenter = ListWorkoutDatesPresenter()
        presenter.view = viewController
        presenter.router = viewController

        let interactor = GetWorkoutDatesInteractor()
        interactor.store = store
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

    func configureModule(for viewController: ListWorkoutDatesViewController,
                         withWorkoutAt index: Int) {
        guard let input = viewController.output as? ListWorkoutDatesModuleInput else {
            return
        }

        input.configure(withWorkoutAt: index)
    }
}
