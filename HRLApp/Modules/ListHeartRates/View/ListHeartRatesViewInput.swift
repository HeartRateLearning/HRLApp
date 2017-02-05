//
//  ListHeartRatesListHeartRatesViewInput.swift
//  HRLApp
//
//  Created by Enrique de la Torre on 03/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

protocol ListHeartRatesViewInput: class {
    func setup(with records: [FoundHeartRateRecord])
}
