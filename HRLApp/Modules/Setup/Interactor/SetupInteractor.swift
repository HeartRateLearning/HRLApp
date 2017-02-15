//
//  SetupSetupInteractor.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

final class SetupInteractor {

    // MARK: - Dependencies

    weak var output: SetupInteractorOutput!

    var coreDataStore: CoreDataConfigurable!
    var healthStoreFactory: HealthStoreFactoryProtocol!
}

// MARK: - SetupInteractorInput methods

extension SetupInteractor: SetupInteractorInput {
    func execute() {
        healthStoreFactory.setup()
        coreDataStore.setup { [weak self] in
            self?.outputSuccess()
        }
    }
}

// MARK: - Private body

private extension SetupInteractor {

    // MARK: - Private methods

    func outputSuccess() {
        output.interactorDidPerformSetup(self)
    }
}
