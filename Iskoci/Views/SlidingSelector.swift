//
//  SlidingSelector.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 23.10.23..
//

import SwiftUI

struct SlidingSelector<T: SelectableItem>: View {
    @Binding var selectables: [T]
    @Binding var selected: T?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(selectables) { selectable in
                    Text(selectable.title)
                        .font(.system(size: 16, weight: .medium))
                        .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
                        .background(selectable.backgroundColor)
                        .foregroundColor(selectable.foregroundColor)
                        .cornerRadius(17)
                        .onTapGesture {
                            selectItem(selectable)
                        }
                }
            }
            .padding(.horizontal, 16)
        }
    }
    
    private func selectItem(_ selectable: T) {
        guard let index = selectables.firstIndex(of: selectable) else { return }
        guard !selectables[index].isSelected else { selectables[index].isSelected = false
            return
        }
        selectables.indices.forEach{ index in selectables[index].isSelected = false
        }
        selectables[index].isSelected = true
        selected = selectable
    }
}

struct SlidingSelector_Preview: PreviewProvider {
    static var previews: some View {
        SlidingSelector(selectables: Binding.constant(SelectableSearch.allSelectables), selected: Binding.constant(nil))
    }
}
