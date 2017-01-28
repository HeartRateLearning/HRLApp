//
//  StoreWorkoutInteractorInput.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 24/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol StoreWorkoutInteractorInput {
    func execute(withWorkoutIndex index: Int, startingOn date: Date)
}
