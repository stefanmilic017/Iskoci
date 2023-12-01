//
//  InfoView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 16.10.23..
//

import SwiftUI

struct InfoView: View {
    let item: BasicItem
    
    var body: some View {
        HStack(spacing: 0) {
            HStack(spacing: 8) {
                Image(item.image)
                    .background(.pickerBackground)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(item.title)
                        .foregroundColor(.white)
                    Text(item.subtitle)
                        .foregroundColor(.eventFooter)
                }
                .font(.system(size:15))
            }
        }
       
    }
}

#Preview {
    let item = InfoItem(image: "location-icon", title: "OKCE, Vranje", subtitle: "Kralja Milana 35")
    
    return InfoView(item: item).background(.primaryBackground)
}
