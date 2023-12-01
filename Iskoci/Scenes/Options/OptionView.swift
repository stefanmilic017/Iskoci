//
//  OptionView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 25.10.23..
//

import SwiftUI

struct OptionView: View {
    @State private var showGreeting = false
    
    var body: some View {
        NavigationBar {
            VStack(spacing: 24) {
                HeaderView(item: SingleTitleItem(title: "Opcije"))
                ScrollView {
                    VStack(spacing: 24) {
                        topListOptions
                        bottomListOptions
                    }
                }
                buttonOptions
            }
            .background(.primaryBackground)

        }
    }
    
    private var topListOptions: some View {
        VStack(spacing: 0) {
            avatarOptions
            Divider()
                .frame(height: 1)
                .background(.infoForeground)
            
            notificationOptions
            Divider()
                .frame(height: 1)
                .background(.infoForeground)
            
            OptionSingleItemView(item: SingleTitleItem(title: "Korisnicka podrska"))
        }
        .background(Color(red: 0.78, green: 0.78, blue: 0.78).opacity(0.12))


    }
    
    private var bottomListOptions: some View {
        VStack(spacing: 0) {
            OptionSingleItemView(item: SingleTitleItem(title: "Dokumenti"))
            
            OptionSingleItemView(item: SingleTitleItem(title: "Uslovi korišćenja"))
            
            OptionSingleItemView(item: SingleTitleItem(title: "Politika privatnosti"))
            
            versionOptions
            Divider()
                .frame(height: 1)
                .background(.infoForeground)
        }
        .background(Color(red: 0.78, green: 0.78, blue: 0.78).opacity(0.12))
    }
    
    private var buttonOptions: some View {
        HStack(alignment: .center, spacing: 0) {
            Button(action:{}) {
                Text("Odjavi se")
                    .font(Font.system(size: 15, weight: .medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 12)
        .frame(width: 358, alignment: .center)
        .cornerRadius(4)
        .overlay(
          RoundedRectangle(cornerRadius: 4)
            .inset(by: 0.5)
            .stroke(.white, lineWidth: 1)
        )
    }
    
        private var avatarOptions: some View {
            HStack {
                Image("event-image")
                VStack(alignment: .leading) {
                    Text("Marko Marković")
                        .foregroundStyle(.white)
                    Text("Podešavanje naloga")
                        .foregroundStyle(.infoForeground)
                }
                Spacer()
                Image("trailing-arrow")
            }
            .padding(.leading, 16)
            
        }
        
        private var notificationOptions: some View {
            HStack {
                Text("Obaveštenja")
                    .foregroundStyle(.white)
                Toggle("", isOn: $showGreeting).toggleStyle(SwitchToggleStyle(tint: .green))
            }
            .padding(.leading, 16)
            .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .leading)
        }
        
        private var versionOptions: some View {
            HStack {
                Text("Verzija")
                    .foregroundStyle(.white)
                Spacer()
                Text("V1.0.0")
                    .foregroundStyle(.infoForeground)
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .leading)
            
            
        }
    }

#Preview {
    OptionView()
}
