//
//  HKWorkoutActivityType+Workout.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 18/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation
import HealthKit

extension HKWorkoutActivityType {
    init(_ workout: Workout) {
        switch workout {
        case Workout.americanFootball:
            self = .americanFootball
        case Workout.archery:
            self = .archery
        case Workout.australianFootball:
            self = .australianFootball
        case Workout.badminton:
            self = .badminton
        case Workout.baseball:
            self = .baseball
        case Workout.basketball:
            self = .basketball
        case Workout.bowling:
            self = .bowling
        case Workout.boxing:
            self = .boxing
        case Workout.climbing:
            self = .climbing
        case Workout.cricket:
            self = .cricket
        case Workout.crossTraining:
            self = .crossTraining
        case Workout.curling:
            self = .curling
        case Workout.cycling:
            self = .cycling
        case Workout.dance:
            self = .dance
        case Workout.elliptical:
            self = .elliptical
        case Workout.equestrianSports:
            self = .equestrianSports
        case Workout.fencing:
            self = .fencing
        case Workout.fishing:
            self = .fishing
        case Workout.functionalStrengthTraining:
            self = .functionalStrengthTraining
        case Workout.golf:
            self = .golf
        case Workout.gymnastics:
            self = .gymnastics
        case Workout.handball:
            self = .handball
        case Workout.hiking:
            self = .hiking
        case Workout.hockey:
            self = .hockey
        case Workout.hunting:
            self = .hunting
        case Workout.lacrosse:
            self = .lacrosse
        case Workout.martialArts:
            self = .martialArts
        case Workout.mindAndBody:
            self = .mindAndBody
        case Workout.mixedMetabolicCardioTraining:
            self = .mixedMetabolicCardioTraining
        case Workout.paddleSports:
            self = .paddleSports
        case Workout.play:
            self = .play
        case Workout.preparationAndRecovery:
            self = .preparationAndRecovery
        case Workout.racquetball:
            self = .racquetball
        case Workout.rowing:
            self = .rowing
        case Workout.rugby:
            self = .rugby
        case Workout.running:
            self = .running
        case Workout.sailing:
            self = .sailing
        case Workout.skatingSports:
            self = .skatingSports
        case Workout.snowSports:
            self = .snowSports
        case Workout.soccer:
            self = .soccer
        case Workout.softball:
            self = .softball
        case Workout.squash:
            self = .squash
        case Workout.stairClimbing:
            self = .stairClimbing
        case Workout.surfingSports:
            self = .surfingSports
        case Workout.swimming:
            self = .swimming
        case Workout.tableTennis:
            self = .tableTennis
        case Workout.tennis:
            self = .tennis
        case Workout.trackAndField:
            self = .trackAndField
        case Workout.traditionalStrengthTraining:
            self = .traditionalStrengthTraining
        case Workout.volleyball:
            self = .volleyball
        case Workout.walking:
            self = .walking
        case Workout.waterFitness:
            self = .waterFitness
        case Workout.waterPolo:
            self = .waterPolo
        case Workout.waterSports:
            self = .waterSports
        case Workout.wrestling:
            self = .wrestling
        case Workout.yoga:
            self = .yoga
        case Workout.other:
            self = .other
        }
    }
}
