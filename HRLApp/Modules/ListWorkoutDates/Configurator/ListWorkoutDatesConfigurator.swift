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

    // MARK: - Private properties

    let store: WorkoutStoreProtocol

    // MARK: - Init methods

    init(store: WorkoutStoreProtocol) {
        self.store = store
    }

    // MARK: - Public methods

    func configureDependencies(for viewInput: UIViewController) {
        guard let viewController = viewInput as? ListWorkoutDatesViewController else {
            return
        }

        configureDependencies(for: viewController)
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

    func configureDependencies(for viewController: ListWorkoutDatesViewController) {
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
