//
//  HomeViewModel.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 9.10.23..
//

import Foundation
import Alamofire

@Observable
final class HomeViewModel {
    
    private var numOfItems = 7
    private var currentPage = 1
    private var totalPagesCount = 0
    
    // MARK: - Wrappers
    var selectedEventType = EventType.all {
        didSet{
            currentPage = 1
            events.removeAll()
            fetchEvents()
            // Paging, pull to refresh
        }
    }
    var selectedOrderingType = SortingOrder.descending {
        didSet{
            currentPage = 1
            events.removeAll()
            fetchEvents()
            // Paging, pull to refresh
        }
    }
    
    var events = [Event]()
    
    // MARK: - Properties
    let title = "Kude s’d \nće iskočiš? 🤔"
    
    func loadMoreEvents () {
        guard totalPagesCount > currentPage else {return}
        currentPage += 1
        fetchEvents()
    }
    
    func fetchEvents (){
        EventsService.getRequest(method: .get, headers: mojHeader, parameters: params, { [weak self] result in
            guard let self else { return }
            guard case .success(let response) = result else { return }
            events += response.result.items
            totalPagesCount = response.result.totalPagesCount
        })
    }
    
    // MARK: - Init
    init() {
        fetchEvents()
    }
        
    func removeFromFavorite(event: Event) {
        EventsService.removeFromFavoriteRequest(method: .delete, url: Urls.favorite("\(event.id)").urlString, headers: mojHeader) {
            [weak self] response in
            guard case .success = response else { return }
            self?.setIsFavorite(false, to: event)
        }
    }
    
    func addToFavorite(event: Event) {
        EventsService.addToFavoriteRequest(method: .post, url: Urls.favorite("\(event.id)").urlString, headers: mojHeader, { [weak self] result in
            guard let self else { return }
            guard case .success(_) = result else { return }
            self.setIsFavorite(true, to: event)
        })
    }
    
    // MARK: - Func
    func handleFavorite(_ event: Event) {
        if !event.isFavorite{
            addToFavorite(event: event)
        } else  {
            removeFromFavorite(event: event)
        }
    }
    
    func setIsFavorite(_ isFavorite: Bool, to event: Event) {
        guard let index = events.firstIndex(of: event) else { return }
        events[index].isFavorite = isFavorite
    }
    
    private var params: [String: Any] {
        [Params.maxRows.rawValue: numOfItems, Params.page.rawValue: currentPage, Params.dateOrder.rawValue: selectedOrderingType.value, Params.dateTime.rawValue: DateFormatType.timeZoneFormat.string(from: Date()), Params.type.rawValue: selectedEventType.value]
    }
}

