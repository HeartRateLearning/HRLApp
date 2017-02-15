//
//  SetupSetupInteractorOutput.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 15/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol SetupInteractorOutput: class {
    func interactorDidPerformSetup(_ interactor: SetupInteractorInput)
    func interactorDidFailToPerformSetup(_ interactor: SetupInteractorInput)
}
