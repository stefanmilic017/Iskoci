//
//  NotificationEventsModel.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 1.11.23..
//

import Foundation

struct NotificationEventsModel {
    var events: [NotificationItem] = [
        NotificationItem(id: 1, eventId: 11, title: "Prva Biciklijada u Vranju", image: "notification-poster", created: "pre 30 minuta", link: "www.vranje.org", isReaded: false),
        NotificationItem(id: 2, eventId: 22, title: "Akcija dobrovoljnog davanja krvi", image: "notification-poster", created: "pre 50 minuta", link: "", isReaded: false),
        NotificationItem(id: 3, eventId: 33, title: "Bezbednost mladih  na internetu", image: "notification-poster", created: "pre 2 sata", link: "www.vranje.org", isReaded: false),
        NotificationItem(id: 4, eventId: 44, title: "Festival “Zlatni puž”", image: "notification-poster", created: "pre 4 dana", link: "www.vranje.org", isReaded: true),
        NotificationItem(id: 5, eventId: 55, title: "Festival “Zlatni puž”", image: "notification-poster", created: "2023-07-23T09:00:00Z", link: "", isReaded: false),
        NotificationItem(id: 6, eventId: 66, title: "Festival “Zlatni puž”", image: "notification-poster", created: "2023-07-23T09:00:00Z", link: "www.vranje.org", isReaded: true),
        NotificationItem(id: 7, eventId: 77, title: "Festival “Zlatni puž”", image: "notification-poster", created: "2023-07-23T09:00:00Z", link: "", isReaded: false)
        ]
}
