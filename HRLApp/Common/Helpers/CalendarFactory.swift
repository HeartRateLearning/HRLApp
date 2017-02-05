//
//  CalendarFactory.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 05/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

// MARK: - Main body

class CalendarFactory {

    // MARK: - Public class methods

    static func makeDefaultCalendar() -> Calendar {
        // NOTICE: 'Calendar.current' is available in iOS 10 or above
        
        return Calendar(identifier: .gregorian)
    }
}
