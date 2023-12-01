//
//  NotificationItem.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 1.11.23..
//

import Foundation

struct NotificationItem: Identifiable, Hashable  {
    let id: Int
    let eventId: Int?
    let title: String
    let image: String
    let created: String
    let link: String?
    let isReaded: Bool
        
    var hasUrl: Bool { link != nil && eventId == nil }
    var subtitle: String {
        hasUrl ? "Izdvajamo" : "Objavljen novi dogadjaj!"
    }
}

// MARK: - Decodable
extension NotificationItem: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case eventId
        case title = "name"
        case image = "picture"
        case created
        case link
        case isReaded = "read"
    }
}
