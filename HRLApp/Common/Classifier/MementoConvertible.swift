//
//  MementoConvertible.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 08/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation

protocol MementoConvertible {
    func makeMemento() -> Data
    func setup(withMemento memento: Data)
}
