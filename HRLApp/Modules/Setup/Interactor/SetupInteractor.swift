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
}

// MARK: - SetupInteractorInput methods

extension SetupInteractor: SetupInteractorInput {
    func execute() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else {
                return
            }

            strongSelf.output.interactorDidPerformSetup(strongSelf)
        }
    }
}
