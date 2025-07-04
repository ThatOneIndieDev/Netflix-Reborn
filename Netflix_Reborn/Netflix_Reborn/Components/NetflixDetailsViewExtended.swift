//
//  NetflixDetailsViewExtended.swift
//  Netflix_Reborn
//
//  Created by Syed Abrar Shah on 29/05/2025.
//

import SwiftUI

struct NetflixDetailsViewExtended: View {
    
    
    
    var title: String = "Reverse 1999"
    var isNewRelease: Bool = true
    var releaseDate: String = "2026"
    var seasonCount: Int? = 12
    var hasClosedCaptions: Bool = true
    var isTopTen: Int? = 7
    var description: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    var CastText: String = "Cast: Relagus, TimeKeeper, Kunji, The Willow"
    var onPlayPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing:8) {
                if isNewRelease {
                    Text("New Release")
                        .foregroundStyle(.green)
                }
                Text(releaseDate)
                
                if let seasonCount {
                    Text("\(seasonCount) Seasons")
                }
                
                if hasClosedCaptions {
                    Image(systemName: "captions.bubble")
                }
            }
            .foregroundStyle(.netflixLightGrey)
            
            if isTopTen != nil {
                HStack(spacing: 8) {
                    topTenRec
                    
                    Text("\(isTopTen!) in TV shows in my life") // a little scary to force unwrap using '!' but something as simple as this will suffice
                        .font(.headline)
                    
                    
                }
            }
            
            VStack(alignment: .center, spacing: 16) {
                detailPlayButton
                detailDownloadButton
            }
            .frame(maxWidth: .infinity)
            
            Text(description)
            
            Text(CastText)
                .foregroundStyle(.netflixLightGrey)


            
        }
        .foregroundStyle(.netflixWhite)
        .padding(.horizontal, 8)
    }
    
    
    private var topTenRec: some View {
                Rectangle()
                    .fill(Color.netflixRed)
                    .frame(width: 28, height: 28)
                    .cornerRadius(5)
                    .overlay(
                        VStack(spacing: -3) {
                            Text("TOP")
                                .fontWeight(.bold)
                                .font(.system(size: 8))
                            Text("10")
                                .fontWeight(.bold)
                                .font(.system(size: 16))
                        }
                            .offset(y:1)
                    )
    }
    
    private var detailPlayButton: some View {
        button(title: "Play", icon: "play.fill", isPrimary: true)
    }
    
    private var detailDownloadButton: some View {
        button(title: "Download", icon: "arrow.down.to.line.alt", isPrimary: false)
    }
    
    // Shared button builder
    private func button(title: String, icon: String, isPrimary: Bool) -> some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
            Text(title)
                .font(.callout)
                .fontWeight(.medium)
        }
        .frame(width: 390, height: 35)
        .foregroundStyle(isPrimary ? .netflixDarkGrey : .netflixWhite)
        .background(isPrimary ? Color.netflixWhite : Color.netflixDarkGrey)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea(edges: .all)
        NetflixDetailsViewExtended()
    }
}
