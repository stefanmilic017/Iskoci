//
//  EventView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 11.10.23..
//

import SwiftUI

struct EventView: View {
    let event: Event
    
    var onFavorite: (Event) -> () = {_ in }
    
    var body: some View {
        HStack(spacing: 16) {
            imageView
            VStack(spacing: 8) {
                startView
                eventNameView
                HStack(spacing: 0) {
                    eventPlaceView
                    Spacer()
                    
                    HStack(spacing: 9) {
                        Button(action:{
                            onFavorite(event)
                            print(event)
                        }) {
                            if event.isFavorite {
                                Image("full-heart-icon")
                            } else {
                                Image("heart-icon")
                            }
                        }
                        ShareLink(item: event.link) {
                            Image("share-icon")
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }

        .foregroundColor(.white)
        .background(.primaryBackground)
    }
    
    private var imageView: some View {
        AsyncImage(url: URL(string: event.picture)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .aspectRatio(contentMode: .fill)
            .frame(width: 114, height: 114)
            .clipped()
            .cornerRadius(8)
    }
    
    private var startView: some View {
        Text(event.startTime)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
            .foregroundColor(.eventHeader)
            .font(.system(size:16))
    }
    
    private var eventNameView: some View {
        Text(event.name)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .font(.system(size:22, weight: .semibold))
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
    }
    
    private var eventPlaceView: some View {
        HStack(spacing: 8) {
            Image("pin")
            Text(event.placeName)
                .lineLimit(1)
        }
        .font(.system(size:14))
        .foregroundColor(.eventFooter)
    }
}


#Preview {
    let event = Event(id: 1, picture: "event-image", name: "DOWNHILL Festival II", description: "", timestamp: 1690923600, streetName: "", placeName: "Trg Kralja Milana", latitude: 0, longitude: 0, price: 0, link: "")
    return EventView(event: event)
}
