//
//  MainView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 28.9.23..
//

import SwiftUI

struct MainView: View {
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        UISegmentedControl.appearance().overrideUserInterfaceStyle = .dark
        
        UISearchBar.appearance().overrideUserInterfaceStyle = .dark
    }
        
    var body: some View {
        TabView {
            Group {
                homeView
                searchView
                favoriteView
                settingsView
            
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Color.tabBarBackground, for: .tabBar)
        }
        .tint(Color.tabBarForeground)
    }
    
    private var homeView: some View {
        HomeView()
            .tabItem {
                Label("Početna", image: "home")
            }
    } 
    private var searchView: some View {
        SearchView()
            .tabItem{
                Label("Pretraga", image: "search")
            }
    }
    private var favoriteView: some View {
        FavoritesView()
            .tabItem {
                Label("Omiljeni", image: "favorites")
            }           
    }
    private var settingsView: some View {
        OptionView()
            .tabItem {
                Label("Opcije", image: "settings")
            }
    }
}

#Preview {
    MainView()
}
