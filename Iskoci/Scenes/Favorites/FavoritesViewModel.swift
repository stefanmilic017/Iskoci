//
//  FavoritesViewModel.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 25.10.23..
//

import Foundation

@Observable
final class FavoritesViewModel {
    
    // MARK: - Properties
    private var numOfItems = 7
    private var currentPage = 1
    private var totalPagesCount = 0
        
    var events = [Event]()
    let emptyScreenItem = InfoItem(image: "empty-favorites", title: "Nemate omiljenih događaja", subtitle: "Dodajte omiljeni događaj kako bi ga sledeći put lakše pronašli.")
    let title = "Omiljeni"
 
    
    func fetchFavoriteEvents() {
        EventsService.getFavoriteEventsRequest(method: .get, parameters: params, headers: mojHeader,  { [weak self] result in
            guard let self else { return }
            guard case .success(let response) = result else { return }
            events = response.result.items
        })
    }
    
    func removeFromFavorite(event: Event) {
        EventsService.removeFromFavoriteRequest(method: .delete, url: Urls.favorite("\(event.id)").urlString, headers: mojHeader) {
            [weak self] response in
            guard case .success = response else { return }
            guard let index = self?.events.firstIndex(of: event) else { return }
//            print(response)
            self?.events.remove(at: index)
        }
    }
    
    private var params: [String: Any] {
        [Params.maxRows.rawValue: numOfItems, Params.page.rawValue: currentPage]
    }
    
}
    


//poziv za registraciju, setujemo success(one time call), swift userdefaults - bool isregistered
    
