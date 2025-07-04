import SwiftUI

struct GridView: View {
    // Sample data for demonstration
    let rows = [
        RowData(title: "Top 10", items: [
            GridItemData(imageName: "Relagus", title: "Top Show 1", isRecentlyAdded: true, topTenRanking: 1),
            GridItemData(imageName: "Relagus", title: "Top Show 2", isRecentlyAdded: false, topTenRanking: 2),
            GridItemData(imageName: "Relagus", title: "Top Show 3", isRecentlyAdded: true, topTenRanking: 3),
            GridItemData(imageName: "Relagus", title: "Top Show 4", isRecentlyAdded: false, topTenRanking: 4),
            GridItemData(imageName: "Relagus", title: "Top Show 5", isRecentlyAdded: false, topTenRanking: 5),
        ]),
        RowData(title: "Recently Added", items: [
            GridItemData(imageName: "Relagus", title: "New Show 1", isRecentlyAdded: true),
            GridItemData(imageName: "Relagus", title: "New Show 2", isRecentlyAdded: true),
            GridItemData(imageName: "Relagus", title: "New Show 3", isRecentlyAdded: true),
            GridItemData(imageName: "Relagus", title: "New Show 4", isRecentlyAdded: true),
        ]),
        RowData(title: "Trending Now", items: [
            GridItemData(imageName: "Relagus", title: "Trending 1", isRecentlyAdded: false),
            GridItemData(imageName: "Relagus", title: "Trending 2", isRecentlyAdded: false),
            GridItemData(imageName: "Relagus", title: "Trending 3", isRecentlyAdded: false),
            GridItemData(imageName: "Relagus", title: "Trending 4", isRecentlyAdded: false),
            GridItemData(imageName: "Relagus", title: "Trending 5", isRecentlyAdded: false),
            GridItemData(imageName: "Relagus", title: "Trending 6", isRecentlyAdded: false),
        ])
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(rows) { row in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(row.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.netflixWhite)
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 12) {
                                    ForEach(row.items) { item in
                                        GridCell(
                                            width: 90,
                                            height: 170,
                                            imageName: item.imageName,
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
                }
                .padding(.vertical)
            }
        }
    }
}

// Data structures
struct RowData: Identifiable {
    let id = UUID()
    let title: String
    let items: [GridItemData]
}

struct GridItemData: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let isRecentlyAdded: Bool
    let topTenRanking: Int?
    
    init(imageName: String, title: String, isRecentlyAdded: Bool, topTenRanking: Int? = nil) {
        self.imageName = imageName
        self.title = title
        self.isRecentlyAdded = isRecentlyAdded
        self.topTenRanking = topTenRanking
    }
}

#Preview {
    GridView()
}
