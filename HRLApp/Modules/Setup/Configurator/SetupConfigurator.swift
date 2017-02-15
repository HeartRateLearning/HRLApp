//
//  SetupSetupConfigurator.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

// MARK: - Main body

final class SetupModuleConfigurator {

    // MARK: - Public methods

    func configureDependencies(for viewInput: UIViewController) {
        guard let viewController = viewInput as? SetupViewController else {
            return
        }

        configureDependencies(for: viewController)
    }
}

// MARK: - Private body

private extension SetupModuleConfigurator {

    // MARK: - Private methods

    func configureDependencies(for viewController: SetupViewController) {
        let presenter = SetupPresenter()
        presenter.view = viewController
        presenter.router = viewController

        let interactor = SetupInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
