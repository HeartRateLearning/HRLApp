//
//  HealthStoreFactoryProtocol.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 01/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol HealthStoreFactoryProtocol {
    func setup()

    func makeHeartRateStore() -> HeartRateStoreProtocol?
}
