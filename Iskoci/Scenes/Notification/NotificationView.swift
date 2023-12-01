//
//  NotificationView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 1.11.23..
//

import SwiftUI

struct NotificationView: View {
    @State private var viewModel = NotificationViewModel()
    
    var body: some View {
            VStack(spacing: 0) {
                HeaderView(item: SingleTitleItem(title: viewModel.title))
                Spacer()
                content
                Spacer()
            }
            .background(.primaryBackground)
            .onAppear {
                viewModel.fetchNotificationEvents()
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
        NotificationList(events: viewModel.events)
    }
}

#Preview {
    NotificationView()
}
