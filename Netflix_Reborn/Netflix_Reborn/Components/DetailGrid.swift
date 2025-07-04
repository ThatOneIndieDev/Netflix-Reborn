//
//  DetailGrid.swift
//  Netflix_Reborn
//
//  Created by Syed Abrar Shah on 29/05/2025.
//

import SwiftUI

struct DetailGrid: View {
    // Sample data for your grid
    let items: [GridItemData] = [
        GridItemData(imageName: "show1", title: "Relagus", isRecentlyAdded: true),
        GridItemData(imageName: "show2", title: "Relagus", isRecentlyAdded: false),
        GridItemData(imageName: "show3", title: "Relagus", isRecentlyAdded: true),
        GridItemData(imageName: "show4", title: "Relagus", isRecentlyAdded: false),
        GridItemData(imageName: "show5", title: "Relagus", isRecentlyAdded: true),
        GridItemData(imageName: "show6", title: "Relagus", isRecentlyAdded: false),
        GridItemData(imageName: "show7", title: "Relagus", isRecentlyAdded: true),
        GridItemData(imageName: "show8", title: "Relagus", isRecentlyAdded: false),
        GridItemData(imageName: "show9", title: "Relagus", isRecentlyAdded: true),
        GridItemData(imageName: "show10", title: "Relagus", isRecentlyAdded: false)
    ]
    
    // Define your grid layout
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items) { item in
                    GridCell(
                        width: 100,  // Slightly wider for better text display
                        height: 190, // Slightly shorter for better grid density
                        imageName: "Relagus",
                        title: item.title,
                        isRecentlyAdded: item.isRecentlyAdded,
                        topTenRanking: item.topTenRanking
                    )
                }
            }
            .padding(.horizontal)
        }
    }
}


// Preview
#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        DetailGrid()
    }
}
