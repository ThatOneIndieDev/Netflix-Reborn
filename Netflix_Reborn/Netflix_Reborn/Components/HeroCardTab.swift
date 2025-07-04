//
//  HeroCardTab.swift
//  Netflix_Reborn
//
//  Created by Syed Abrar Shah on 28/05/2025.
//

import SwiftUI

struct HeroCardTab: View {
    var body: some View {
        HStack(spacing: 16) {
            playButton
            myListButton
        }
        .padding(.horizontal, 16)
    }
    
    // MARK: - Private Button Views
    private var playButton: some View {
        button(title: "Play", icon: "play.fill", isPrimary: true)
    }
    
    private var myListButton: some View {
        button(title: "My List", icon: "plus", isPrimary: false)
    }
    
    // Shared button builder
    private func button(title: String, icon: String, isPrimary: Bool) -> some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
            Text(title)
        }
        .frame(width: 120, height: 35)
        .foregroundStyle(isPrimary ? .netflixDarkGrey : .netflixWhite)
        .background(isPrimary ? Color.netflixWhite : Color.netflixDarkGrey)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
#Preview {
    
    ZStack{
        Color.black.ignoresSafeArea(edges: .all)
        HeroCardTab()
    }
    

}
