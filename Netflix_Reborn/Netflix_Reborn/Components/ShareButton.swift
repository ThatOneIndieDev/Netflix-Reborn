//
//  ShareButton.swift
//  Netflix_Reborn
//
//  Created by Syed Abrar Shah on 29/05/2025.
//

import SwiftUI

struct ShareButton: View {
    
    var url: String = "https://syed-abrar-shah.vercel.app/"
    
    var body: some View {
        if let url = URL(string: url){
            ShareLink(item: url){
                VStack(spacing: 8){
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                    
                    Text("Share")
                        .font(.caption)
                        .foregroundStyle(.netflixLightGrey)
                }
                .foregroundStyle(.netflixWhite)
                .padding(8)
                .background(Color.netflixBlack.opacity(0.001))
                
            }
        }

    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea(edges: .all)
        ShareButton()
    }
}
