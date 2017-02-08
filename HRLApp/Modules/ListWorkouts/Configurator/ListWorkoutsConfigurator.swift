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

    // MARK: - Private properties

    var store: WorkoutStoreProtocol

    // MARK: - Init methods

    init(store: WorkoutStoreProtocol) {
        self.store = store
    }

    // MARK: - Public methods

    func configureDependencies(for viewInput: UIViewController) {
        guard let viewController = viewInput as? ListWorkoutsViewController else {
            return
        }

        configureDependencies(for: viewController)
    }
}

// MARK: - Private body

private extension ListWorkoutsModuleConfigurator {

    // MARK: - Private methods

    func configureDependencies(for viewController: ListWorkoutsViewController) {
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
