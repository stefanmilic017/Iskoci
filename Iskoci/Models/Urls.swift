//
//  Urls.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 6.11.23..
//

import Foundation

enum Urls {
    case base
    case events
    case search
    case userDeviceId
    case favorite(String)
    case getFavorites
    case getNotificationEvents
    
    var urlString: String {
        switch self {
        case .base:
            return "https://api.kuda-vr.xyz/"
        case .events:
            return "\(Urls.base.urlString)api/event"
        case .search:
            return "\(Urls.base.urlString)api/event/name"
        case .userDeviceId:
            return "\(Urls.base.urlString)api/user/deviceid"
        case .favorite(let id):
            return "\(Urls.base.urlString)api/user/\(id)"
        case .getFavorites:
            return "\(Urls.base.urlString)api/user/favorites"
        case .getNotificationEvents:
            return "\(Urls.base.urlString)api/user/notifications"
        }
    }
}
