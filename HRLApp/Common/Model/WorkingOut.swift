//
//  WorkingOut.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 06/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

enum WorkingOut {
    case unknown
    case `false`
    case `true`

    // MARK: - Init methods

    init(_ isWorkingOut: Bool) {
        self = (isWorkingOut ? .`true` : .`false`)
    }
}
