//
//  DataFramePersistentStoreProtocol.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 09/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation
import HRLClassifier

protocol DataFramePersistentStoreProtocol {
    func read() -> DataFrame
    func write(_ dataFrame: DataFrame)
}
