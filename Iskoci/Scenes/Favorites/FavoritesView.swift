//
//  FavoritesView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 25.10.23..
//

import SwiftUI

struct FavoritesView: View {
    
    @State private var viewModel = FavoritesViewModel()
    
    var body: some View {
        NavigationBar {
            VStack(spacing: 0) {
                HeaderView(item: SingleTitleItem(title: viewModel.title))
                Spacer()
                content
                Spacer()
            }
            .background(.primaryBackground)
            .onAppear{
                viewModel.fetchFavoriteEvents()
            }
        }
    }
    
    @ViewBuilder private var content: some View {
        if viewModel.events.isEmpty {
            emptyScreen
        }
        else {
            eventList
        }
    }
 
    private var emptyScreen: some View {
        EmptyScreen(item: viewModel.emptyScreenItem)
    }
    
    private var eventList: some View {
        EventList(events: $viewModel.events, onFavorite: { event in viewModel.removeFromFavorite(event: event)})
    }
}

#Preview {
    FavoritesView()
}
