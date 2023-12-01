//
//  SearchViewModel.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 20.10.23..
//

import Foundation
import Combine

@Observable
final class SearchViewModel {
    
    // MARK: - Wrappers
    
    var selectedEvent: Event!
    var searchText = ""
    var events: [Event] = []
    
    // MARK: - Properties
    
    let emptyScreenItem = InfoItem(image: "magnifier", title: "", subtitle: "Ukucaj termin u polje za pretragu kako bi pronašao događaj koji bi posetio.")
    let noResultsItem = InfoItem(image: "magnifier", title: "Nema rezultata", subtitle: "Promeni termin pretrage pa probaj ponovo.")
    
    var selectables = SelectableSearch.allSelectables
    var selected: SlidingSelectable? = nil {
        didSet {
            print(selected?.title ?? "")
            fetchEvents()
            
            print(params)
            print(selected?.isSelected)
        }
    }
    
    private var numOfItems = 7
    private var currentPage = 1
    
    var timer: Timer?
    
    func setTimeout () {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { [weak self] _ in
            guard let self else { return }
            fetchEvents()
        }
    }
    
    private var mainModel = MainViewModel()

   func fetchEvents (){
       EventsService.getRequest(method: .get, url: Urls.search.urlString, headers: mojHeader, parameters: params, { [weak self] result in
            guard let self else { return }
            guard case .success(let response) = result else { return }
            events = response.result.items
        })
       
       print(params)
    }
        
    private var currentDateTime: String {
        guard selected != nil else { return "" }
        return DateFormatType.timeZoneFormat.string(from: Date())

    }
    
    private var params: [String: Any] {
        [Params.searchTerm.rawValue: searchText, Params.dateShortcut.rawValue: selected?.type.rawValue ?? "", Params.dateTime.rawValue: currentDateTime, Params.maxRows.rawValue: numOfItems, Params.page.rawValue: currentPage]
    }
}
