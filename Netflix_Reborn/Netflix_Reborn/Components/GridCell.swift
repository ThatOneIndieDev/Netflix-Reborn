//
//  GridCell.swift
//  Netflix_Reborn
//
//  Created by Syed Abrar Shah on 28/05/2025.
//

import SwiftUI

struct GridCell: View {
    
    var width: CGFloat = 100
    var height: CGFloat = 200
    var imageName: String = "Relagus"
    var title: String? = "Relagus"
    var isRecentlyAdded: Bool = false
    var topTenRanking: Int? = nil
    
    
    var body: some View {
        HStack(alignment: .bottom, spacing: -8) {
            
            if let topTenRanking {
                Text("\(topTenRanking)")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                    .offset(y:20)
            }
            
            ZStack(alignment: .bottom) {
                Image(imageName)
                    .resizable()
                    .frame(width: width, height: height)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                VStack(spacing: 0){
                    if let title, let firstWord = title.split(separator: " ").first {
                        Text(firstWord)
                            .font(.subheadline)
                            .lineLimit(1)
                            .fontWeight(.medium)
                    }
                    
                    Text("Recently Added")
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .frame(maxWidth: .infinity)
                        .background(Color.netflixRed)
                        .clipShape(Rectangle())
                        .lineLimit(1)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.1)
                        .padding(.horizontal, 4)
                        .opacity(isRecentlyAdded ? 1 : 0)
                }
                .frame(width: width)
                .padding(.bottom, 6)
                .foregroundStyle(.netflixWhite)
                
                
            }
        }
        .foregroundStyle(Color.netflixWhite)

    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea(edges: .all)
        GridCell(isRecentlyAdded: true, topTenRanking: 10)
    }

}
