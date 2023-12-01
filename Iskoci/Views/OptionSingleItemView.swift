//
//  OptionSingleItemView.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 30.10.23..
//

import SwiftUI

struct OptionSingleItemView: View {
    let item: SingleTitleItem
    
    var body: some View {
        VStack(spacing: 0){
            HStack{
                Text(item.title)
                    .font(.system(size: 17))
                    .foregroundStyle(.white)
                Spacer()
                Image("trailing-arrow")
                
            }
            .padding(.leading, 16)

            .frame(maxHeight: .infinity)
            
            Divider()
             .frame(height: 1)
             .background(.infoForeground)
        }
        
        .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44)
       
    }
}

#Preview {
    let item = SingleTitleItem(title: "Korisnicka podrska")
    
    return OptionSingleItemView(item: item).background(.pickerBackground)
}
