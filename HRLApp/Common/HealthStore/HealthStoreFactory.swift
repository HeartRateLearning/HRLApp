//
//  HealthStoreFactory.swift
//  HRLApp
//
//  Created by Enrique de la Torre (dev) on 01/02/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

import Foundation
import HealthKit

// MARK: - Main body

class HealthStoreFactory {

    // MARK: - Private properties

    fileprivate let store = HKHealthStore()
    fileprivate var state = State.rejected
}

// MARK: - HealthStoreFactoryProtocol methods

extension HealthStoreFactory: HealthStoreFactoryProtocol {
    func setup() {
        guard state != .requesting else {
            print("Already requesting authorization")

            return
        }

        guard HKHealthStore.isHealthDataAvailable() else {
            print("Health data is NOT available")

            state = .rejected

            return
        }

        state = .requesting

        let completion = { [weak self] (success: Bool, error: Error?) in
            if !success {
                print("Request Authorization Error: \(error)")
            }

            DispatchQueue.main.async {
                self?.state = State(success)
            }
        }
        store.requestAuthorization(toShare: nil,
                                   read: [HeartRateStore.heartRateType],
                                   completion: completion)
    }

    func makeHeartRateStore() -> HeartRateStore? {
        return state == .authorized ? HeartRateStore(store: store) : nil
    }
}

// MARK: - Private body

private extension HealthStoreFactory {

    // MARK: - Type definitions

    enum State {
        case authorized
        case rejected
        case requesting

        init(_ success: Bool) {
            self = success ? .authorized : .rejected
        }
    }
}
