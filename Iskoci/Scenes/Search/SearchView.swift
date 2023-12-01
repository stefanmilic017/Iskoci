//
//  SearchView.swift
//  Iskoci
//
//  Created by Vukasin Popovic on 20.10.23..
//

import SwiftUI

struct SearchView: View {
    @State private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationBar {
            VStack(spacing: 0) {
                slidingSelector
                Spacer()
                content
                Spacer()
            }
            .background(.primaryBackground)
        }
        .searchable(text: $viewModel.searchText)
        .onChange(of: viewModel.searchText) {
            viewModel.setTimeout()
        }
      
    }
    
    // MARK: - Properties
    
    @ViewBuilder private var content: some View {
        if viewModel.searchText == "" {
            emptyScreen
        }
        else if viewModel.events.isEmpty {
            noSearchResultsScreen
        }
        else {
            eventList
        }
    }
    
    private var slidingSelector: some View {
        SlidingSelector<SlidingSelectable>(selectables: $viewModel.selectables, selected: $viewModel.selected)
        .padding(.top, 16)
        .padding(.bottom, 24)
    }

    private var eventList: some View {
        EventList(events: $viewModel.events)
            .refreshable {
//                Task{ await viewModel.reload() }
            }
    }
    
    private var emptyScreen: some View {
        EmptyScreen(item: viewModel.emptyScreenItem)
    }
    
    private var noSearchResultsScreen: some View {
        EmptyScreen(item: viewModel.noResultsItem)
    }

}

#Preview {
    SearchView()
}
