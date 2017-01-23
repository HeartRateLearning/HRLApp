//
//  ListWorkoutsListWorkoutsConfigurator.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 16/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

class ListWorkoutsModuleConfigurator {

    // MARK: - Public methods

    func configureModuleForViewInput(viewInput: UIViewController) {
        guard let viewController = viewInput as? ListWorkoutsViewController else {
            return
        }

        configure(viewController: viewController)
    }
}

// MARK: - Private body

private extension ListWorkoutsModuleConfigurator {
    func configure(viewController: ListWorkoutsViewController) {
        let store = WorkoutStore()

        let router = ListWorkoutsRouter()
        router.viewController = viewController

        let presenter = ListWorkoutsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = GetConfiguredWorkoutsInteractor()
        interactor.store = store
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
