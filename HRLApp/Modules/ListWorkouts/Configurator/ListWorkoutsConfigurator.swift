//
//  ListWorkoutsListWorkoutsConfigurator.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

final class ListWorkoutsModuleConfigurator {

    // MARK: - Public methods

    func configureDependencies(for viewInput: UIViewController,
                               with store: WorkoutStoreProtocol) {
        guard let viewController = viewInput as? ListWorkoutsViewController else {
            return
        }

        configureDependencies(for: viewController, with: store)
    }
}

// MARK: - Private body

private extension ListWorkoutsModuleConfigurator {

    // MARK: - Private methods

    func configureDependencies(for viewController: ListWorkoutsViewController,
                               with store: WorkoutStoreProtocol) {
        let presenter = ListWorkoutsPresenter()
        presenter.view = viewController
        presenter.router = viewController

        let interactor = GetStoredWorkoutsInteractor()
        interactor.store = store
        interactor.output = presenter

        store.delegate = interactor
        presenter.interactor = interactor
        viewController.output = presenter
    }
}
