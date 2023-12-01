//
//  EmptyScreen.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 23.10.23..
//

import SwiftUI

struct EmptyScreen: View {
    
    let item: BasicItem
    
    var body: some View {
        VStack(spacing: 24) {
            Image(item.image)
            VStack(spacing: 8) {
                Text(item.title)
                    .foregroundStyle(.white)
                    .font(Font.custom("SF Pro", size: 20))
                Text(item.subtitle)
                    .foregroundStyle(.infoForeground)
                    .font(Font.custom("SF Pro", size: 18))
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    let item = InfoItem(image: "magnifier", title: "Nema rezultata", subtitle: "Promeni termin pretrage pa probaj ponovo.")
    
    return EmptyScreen(item: item).background(.primaryBackground)
}
