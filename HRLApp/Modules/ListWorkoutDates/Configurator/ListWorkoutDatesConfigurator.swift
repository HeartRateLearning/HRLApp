//
//  ListWorkoutDatesListWorkoutDatesConfigurator.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 30/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

class ListWorkoutDatesModuleConfigurator {

    // MARK: - Public methods

    func configureModule(for viewInput: UIViewController) {
        guard let viewController = viewInput as? ListWorkoutDatesViewController else {
            return
        }

        configure(viewController)
    }
}

// MARK: - Private body

private extension ListWorkoutDatesModuleConfigurator {
    func configure(_ viewController: ListWorkoutDatesViewController) {
        let router = ListWorkoutDatesRouter()

        let presenter = ListWorkoutDatesPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ListWorkoutDatesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
