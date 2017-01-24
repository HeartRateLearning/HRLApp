//
//  Workout.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 22/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

enum Workout: Int {
    case americanFootball
    case archery
    case australianFootball
    case badminton
    case baseball
    case basketball
    case bowling
    case boxing
    case climbing
    case cricket
    case crossTraining
    case curling
    case cycling
    case dance
    case elliptical
    case equestrianSports
    case fencing
    case fishing
    case functionalStrengthTraining
    case golf
    case gymnastics
    case handball
    case hiking
    case hockey
    case hunting
    case lacrosse
    case martialArts
    case mindAndBody
    case mixedMetabolicCardioTraining
    case paddleSports
    case play
    case preparationAndRecovery
    case racquetball
    case rowing
    case rugby
    case running
    case sailing
    case skatingSports
    case snowSports
    case soccer
    case softball
    case squash
    case stairClimbing
    case surfingSports
    case swimming
    case tableTennis
    case tennis
    case trackAndField
    case traditionalStrengthTraining
    case volleyball
    case walking
    case waterFitness
    case waterPolo
    case waterSports
    case wrestling
    case yoga
    case other
}

// MARK: - Sequence methods

extension Workout: Sequence {
    func makeIterator() -> WorkoutIterator {
        return WorkoutIterator(first: self)
    }
}

// MARK: - String extension

extension String {
    init(_ workout: Workout) {
        self = "\(workout)"
    }
}
