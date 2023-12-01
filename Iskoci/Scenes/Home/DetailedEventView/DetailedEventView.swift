//
//  DetailedEventView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 16.10.23..
//

import SwiftUI

struct DetailedEventView: View {
    @Binding var event: Event
    var onFavorite: (Event) -> () = {_ in }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                posterView
                Group {
                    titleView
                    scheduleView
                    Divider().background(.white)
                    eventDescriptionView
                    Divider().background(.white)
                    locationView
                }
                .padding(.horizontal, 16)
                
                Spacer()
            }
            .foregroundColor(.white)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing){
                    HStack(spacing: 8) {
                        Button(action:{
                            onFavorite(event)
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
            })
        }
        .background(.primaryBackground)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(.tabBarBackground, for: .navigationBar)

        .toolbar(.hidden, for: .tabBar)
    }
    
    private var posterView: some View {
        Image(event.poster)
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .onAppear{ 
                print(event)
            }
    }
    
    private var titleView: some View {
        Text(event.name)
            .font(
                Font.custom("SF Pro", size: 34)
                    .weight(.bold)
            )
            .foregroundColor(.white)
            .frame(width: 358, alignment: .topLeading)
    }
    private var scheduleView: some View {
        VStack(alignment: .leading, spacing: 24) {
            InfoView(item: event.calendarItem)
            InfoView(item: event.locationItem)
            InfoView(item: event.payItem)
        }
        .font(Font.custom("SF Pro", size: 15))
        .padding(.horizontal, 0)
        .padding(.top, 0)
        .padding(.bottom, 24)
    }
    
    private var eventDescriptionView: some View {
        Group {
            Text("Opis dogadjaja")
                .padding(.top, 16)
                .font(
                    Font.custom("SF Pro", size: 20)
                        .weight(.semibold)
                )
            Text(event.description)
                .font(Font.custom("SF Pro", size: 15))
                .foregroundColor(.white)
            
                .padding(.vertical, 16)
                .lineLimit(6)
                .lineSpacing(3.5)
            Button(action:{
              
            }) {
                Text("Saznaj vise")
                Text("→")
            }
            .foregroundColor(.orange)
        }
    }
    
    private var locationView: some View {
        Group {
            Text("Lokacija")
                .font(
                    Font.custom("SF Pro", size: 20)
                        .weight(.semibold)
                )
                .padding(.vertical, 16)
            
            MapView(event: event)
                .frame(height: 192)
        }
    }
}



#Preview {
    let event = Event(id: 1, picture: "event-poster", name: "DOWNHILL Festival II", description: "Kancelarija za mlade pod pokroviteljstvom Grada Vranja organizuje drugi po redu DOWNHILL festival u subotu 09.09.2023. godine u atrijumskom delu sale Okce sa početkom od 20h na kome će nastupiti 4 renomirana benda, koji su se proslavili u žanru southern/stoner/sludge/metal/rock.", timestamp: 1690923600, streetName: "Cara Dusana 14", placeName: "Niski kulturni centar", latitude: 43.31113882818083, longitude: 21.899212026720424, price: 0, link: "https://www.vranje.rs")
    
    return DetailedEventView(event: Binding.constant(event))
}
