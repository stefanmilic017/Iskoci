//
//  UserDefaultsHelper.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 20.11.23..
//

import Foundation

struct UserDefaultsHelper {
    public enum Keys {
        case isRegistered
        case userId
        
        var value: String {
            switch self {
            case .isRegistered:
                return "isRegistered"
            case .userId:
                return "userId"
            }
        }
    }
}
