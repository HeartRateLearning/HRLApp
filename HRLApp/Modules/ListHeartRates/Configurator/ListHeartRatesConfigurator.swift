//
//  ListHeartRatesListHeartRatesConfigurator.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import UIKit

class ListHeartRatesModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ListHeartRatesViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ListHeartRatesViewController) {

        let router = ListHeartRatesRouter()

        let presenter = ListHeartRatesPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ListHeartRatesInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
