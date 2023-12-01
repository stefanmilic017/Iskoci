//
//  SortingOrder.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 11.10.23..
//

import Foundation

enum SortingOrder: CaseIterable {
    case ascending
    case descending
    
    var title: String {
        switch self {
        case .ascending:
            return "Najskorije"
        case .descending:
            return "Najkasnije"
        }
    }
    
    var value: String {
        switch self {
        case .ascending:
            return "theOldest"
        case .descending:
            return "mostRecent"
        }
    }
}
