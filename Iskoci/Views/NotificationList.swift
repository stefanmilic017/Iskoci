//
//  NotificationList.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 1.11.23..
//

import SwiftUI

struct NotificationList: View {
    let events: [NotificationItem]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ForEach(events) {event in
                    NavigationLink(value: event) {
                        NotificationEventListView(event: event)
                    }
                    Spacer()
               
                    if event.id != events.last?.id {
                        Divider().background(.white)
                            .padding(.horizontal, 16)
                    }
                }
              
            }
        }
//        .navigationDestination(for: Event.self) { event in
//            DetailedEventView(event: event)
//        }
    }
}

#Preview {
    let list = [NotificationItem(id: 1, eventId: 11, title: "Prva Biciklijada u Vranju", image: "notification-poster", created: "1690102800", link: "", isReaded: false)]
    
    return NotificationList(events: list)
        .background(.primaryBackground)
}
