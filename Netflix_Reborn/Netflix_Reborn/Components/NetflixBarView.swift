//
//  NetflixBarView.swift
//  Netflix_Reborn
//
//  Created by Syed Abrar Shah on 28/05/2025.
//

import SwiftUI

struct FilterModel: Hashable, Equatable{
    let title: String
    let isDropdown: Bool
    
    static var mockArray: [FilterModel] = [
        FilterModel(title: "TV Shows", isDropdown: false),
        FilterModel(title: "Movies", isDropdown: false),
        FilterModel(title: "Catagories", isDropdown: true)
    ]
}

struct NetflixBarView: View {
    
    var filters: [FilterModel] = FilterModel.mockArray
    var selectedFilter: FilterModel? = nil
    var filterPressed: ((FilterModel) -> Void)? = nil
    var onXMarkTapped: (() -> Void)? = nil
    
    
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth: 1))
                        )
                        .foregroundStyle(.netflixLightGrey)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onXMarkTapped?()
                        }
                        .transition(AnyTransition.move(edge: .trailing))
                        .padding(.leading, 16)
                }

                
                ForEach(filters, id: \.self){filter in
                    
                    if selectedFilter == nil || selectedFilter == filter {
                        NetflixFilterCell(title: filter.title,
                                          isSelected: selectedFilter == filter, isDropwdown: filter.isDropdown
                        )
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            filterPressed?(filter)
                        }
                        .padding(.leading, ((selectedFilter == nil) && filter == filters.first) ? 16 : 0)
                    }

                }
            }
            .padding(.vertical, 4)
            .fixedSize(horizontal: false, vertical: true)
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }

}

fileprivate struct NetflixFilterBarPreview: View {
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    
    // INSTEAD OF USING A BINDING STATE FOR OUR DATA WE HAVE USED THIS METHOD SO THAT INCASE WE EVER WANTED TO DO SOMETHING BEFORE OUR UI UPDATES WE CAN DO THAT ASWELL. IF I USED BINDING THE UI WOULD IMMEDIATLY UPDATE
    
    var body: some View {
        NetflixBarView(
            filters: filters,
            selectedFilter: selectedFilter,
            filterPressed: { newFilter in
                selectedFilter = newFilter
            },
            onXMarkTapped: {
                selectedFilter = nil
            }
            
        )
        
    }
}
    #Preview {
        ZStack{
            Color.black.ignoresSafeArea(edges: .all)
            NetflixFilterBarPreview()
            
        }
}

