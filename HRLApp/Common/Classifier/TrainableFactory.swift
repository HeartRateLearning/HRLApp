//
//  TrainableFactory.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 16/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol TrainableFactory {
    func makeTrainable(workout: Workout) -> Trainable
}
