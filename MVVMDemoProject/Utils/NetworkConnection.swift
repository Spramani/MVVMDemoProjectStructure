//
//  NetworkConnection.swift
//  UAEProLeague
//
//  Created by Mobiiworld on 30/03/2020.
//  Copyright © 2020 Mobiiworld. All rights reserved.
//

import UIKit
import Alamofire

class NetworkConnection {
    static let shared = NetworkConnection()
    let reachabilityManager: NetworkReachabilityManager?
    private init() {
        reachabilityManager = NetworkReachabilityManager()
    }
    var isConnected: Bool {
        if let reachability = reachabilityManager, reachability.isReachable {
            return true
        } else {
            return false
        }
    }
}
