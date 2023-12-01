//
//  SelectableSearch.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 20.10.23..
//

import Foundation

enum SelectableSearch: String, CaseIterable {
    case today
    case tomorrow
    case thisWeek
    case thisMonth
    
    static var allSelectables: [SlidingSelectable] {
        [SelectableSearch.today.slidingSelectable, SelectableSearch.tomorrow.slidingSelectable, SelectableSearch.thisWeek.slidingSelectable, SelectableSearch.thisMonth.slidingSelectable]
    }
    
    var slidingSelectable: SlidingSelectable {
        switch self {
            case .today:
                return SlidingSelectable(title: "Danas", type: self)
            case .tomorrow:
                return SlidingSelectable(title: "Sutra", type: self)
            case .thisWeek:
                return SlidingSelectable(title: "Ove nedelje", type: self)
            case .thisMonth:
                return SlidingSelectable(title: "Ovog meseca", type: self)
        }
    }
}


