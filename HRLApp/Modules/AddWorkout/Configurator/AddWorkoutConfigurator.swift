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

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        guard let viewController = viewInput as? AddWorkoutViewController else {
            return
        }

        configure(viewController: viewController)
    }
}

// MARK: - Private body

private extension AddWorkoutModuleConfigurator {
    func configure(viewController: AddWorkoutViewController) {
        let router = AddWorkoutRouter()

        let presenter = AddWorkoutPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = GetAllWorkoutsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
