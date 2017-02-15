//
//  SetupSetupPresenter.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

final class SetupPresenter {

    // MARK: - Dependencies

    weak var view: SetupViewInput!
    weak var router: SetupRouterInput!

    var interactor: SetupInteractorInput!
}

// MARK: - SetupModuleInput methods

extension SetupPresenter: SetupModuleInput {}

// MARK: - SetupViewOutput methods

extension SetupPresenter: SetupViewOutput {
    func viewIsReady() {
        DispatchQueue.main.async { [weak router] in
            router?.presentWorkoutList()
        }
    }
}

// MARK: - SetupInteractorOutput methods

extension SetupPresenter: SetupInteractorOutput {}
