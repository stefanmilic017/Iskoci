//
//  HeaderView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 30.10.23..
//

import SwiftUI

struct HeaderView: View {
    let item: SingleTitleItem
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(item.title)
                .font(.system(size: 34))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal, 16)
        .padding(.top, 3)
        .padding(.bottom, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.tabBarBackground)
        .foregroundColor(.white)
    }
}

#Preview {
    let item = SingleTitleItem(title: "Opcije")
    return HeaderView(item: item)
}
