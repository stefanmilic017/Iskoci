//
//  EventResults.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 6.11.23..
//

import Foundation

struct EventResults: Decodable {
    let items: [Event]
    let totalPagesCount: Int
    let totalItemsCount: Int
}
