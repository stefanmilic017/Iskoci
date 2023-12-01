//
//  NotificationEventListView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 1.11.23..
//

import SwiftUI

struct NotificationEventListView: View {
    let event: NotificationItem

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            imageView
            VStack(alignment: .leading, spacing: 4) {
                eventSubtitle
                eventTitle
                eventCreated
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
        .padding(.bottom, 12)
        .foregroundColor(.white)
        .background(.primaryBackground)
        
        
    }
    
    private var imageView: some View {
        
        ZStack(alignment: .topTrailing) {
            Image(event.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 64, height: 64)
                .clipped()
                .cornerRadius(4)
            if !event.isReaded {
                Image("indicator")
                    .padding(.top, -6)
                    .padding(.trailing, -6)
            }
            
        }
    }
    
    private var eventSubtitle: some View {
        HStack {
            Text(event.subtitle)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .foregroundColor(Color(red: 0.96, green: 0.76, blue: 0.15))
            if event.link != "" {
                Image("chain")
            }
        }
        .font(Font.system(size: 13, weight: .medium))
    }
    
    private var eventTitle: some View {
        Text(event.title)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .font(
                Font.system(size: 15, weight: .semibold)
            )
            .foregroundColor(.white)
    }
    
    private var eventCreated: some View {
        Text(event.created)
            .font(Font.system(size: 13))
            .foregroundColor(Color(red: 0.78, green: 0.78, blue: 0.78))
        
    }
}

#Preview {
    let event = NotificationItem(id: 1, eventId: 1, title: "Prva Biciklijada u Vranju", image: "notification-poster", created: "pre 50 minuta", link: "", isReaded: false)
    return NotificationEventListView(event: event)
}


