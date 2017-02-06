//
//  SaveWorkingOutsInteractorOutput.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 06/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol SaveWorkingOutsInteractorOutput: class {
    func interactorDidSaveWorkingOuts(_ interactor: SaveWorkingOutsInteractorInput)
    func interactorDidFailToSaveWorkingOuts(_ interactor: SaveWorkingOutsInteractorInput)
}
