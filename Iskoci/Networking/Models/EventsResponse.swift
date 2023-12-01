//
//  EventsResponse.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 6.11.23..
//

import Foundation

struct EventsResponse: Decodable {
    let version: String
    let message: String
    let result: EventResults    
}

