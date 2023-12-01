//
//  NotificationViewModel.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 1.11.23..
//

import Foundation

final class NotificationViewModel {
    // MARK: - Properties
    private var numOfItems = 7
    private var currentPage = 1
    
    let emptyScreenItem = InfoItem(image: "notification-bell", title: "Nema novih obaveštenja", subtitle: "Ukljucite obaveštenja u opcijama kako bi ste bili u toku sa najnovijim dešavanjima.")
    let title = "Obavestenja"
    
    var events = [NotificationItem]()

    func fetchNotificationEvents() {
        EventsService.getNotificationEventsRequest(method: .get, parameters: params, headers: mojHeader) { [weak self] result in
            guard let self else { return }
            guard case .success(let response) = result else { return }
            events = response.result.item
        }
    }
    
    private var params: [String: Any] {
        [Params.maxRows.rawValue: numOfItems, Params.page.rawValue: currentPage]
    }}
