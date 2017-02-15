//
//  SetupSetupConfigurator.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class SetupModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? SetupViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: SetupViewController) {

        let router = SetupRouter()

        let presenter = SetupPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SetupInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
