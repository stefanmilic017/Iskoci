//
//  HomeView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 9.10.23..
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel = HomeViewModel()
    
    var onFavorite: (Event) -> () = {_ in}
    
    var body: some View {
        NavigationBar {
            VStack(alignment: .leading, spacing: 0) {
                HeaderView(item: SingleTitleItem(title: viewModel.title))
                segmentPicker
                sortingMenu
                eventList
            }
            .navigationTitle("Nazad")
            .background(.primaryBackground)
        }
    }
    
    //MARK: - properties
    
    private var eventList: some View {
        EventList(events: $viewModel.events, onEndOfList: {
            viewModel.loadMoreEvents()
        }, onFavorite: {event in
            viewModel.handleFavorite(event)
        })
    }
    
    private var segmentPicker: some View {
        Picker("Selection event category", selection: $viewModel.selectedEventType) {
            
            ForEach(EventType.allCases, id: \.self) {
                eventType in
                Text(eventType.title)
            }
        }
        .pickerStyle(.segmented)
        .padding()
    }
    
    private var sortingMenu: some View {
        Picker("Selecting sorting order", selection: $viewModel.selectedOrderingType) {
            ForEach(SortingOrder.allCases, id: \.self) {
                sorting in Text(sorting.title)
            }                    
        }
        .padding(.trailing, 16)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

#Preview {
    HomeView()
}
