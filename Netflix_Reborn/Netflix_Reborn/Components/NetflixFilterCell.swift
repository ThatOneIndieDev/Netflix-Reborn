//
//  NetflixFilterCell.swift
//  Netflix_Reborn
//
//  Created by Syed Abrar Shah on 28/05/2025.
//

import SwiftUI

struct NetflixFilterCell: View {
    
    var title: String = "Catagories"
    var isSelected: Bool = false
    var isDropwdown: Bool = true
    
    
    var body: some View {
        ZStack{
            Color.netflixBlack.ignoresSafeArea(edges: .all)
            
            HStack(spacing: 4){
                Text(title)
                
                Image(systemName: isDropwdown ? "chevron.down": "")
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                ZStack{
                    Capsule(style: .circular)
                        .fill(Color.netflixDarkGrey)
                        .opacity(isSelected ? 1 : 0)

                    Capsule(style: .circular)
                        .stroke(lineWidth: 1)
                }
            )
            .foregroundStyle(.netflixLightGrey)
        }
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea(edges: .all)
        VStack{
            NetflixFilterCell()
            NetflixFilterCell(isSelected: true)
            NetflixFilterCell(isDropwdown: false)
        }
    }
}
