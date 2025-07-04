//
//  RateButton.swift
//  Netflix_Reborn
//
//  Created by Syed Abrar Shah on 29/05/2025.
//

import SwiftUI


enum RateOption: String, CaseIterable {
    
    case dislike, like, love
    
    var title: String {
        switch self {
        case .dislike:
            return "Not for me"
            
        case .like:
            return "I Like this"
            
        case .love:
            return "I Love this"
        }
    }
    
    var iconName: String {
        switch self {
        case .dislike:
            return "hand.thumbsdown"
            
        case .like:
            return "hand.thumbsup"
            
        case .love:
            return "heart"
        }
    }
    
    
}

struct RateButton: View {
    
    @State private var showPopover: Bool = false
    var ratingSelected: ((RateOption)->Void)? = nil
    
    var body: some View {
        VStack(spacing: 8){
            
            ZStack{
                Image(systemName: "hand.thumbsup")

            }
            .font(.title)

            Text("Rate")
                .font(.caption)
                .foregroundStyle(.netflixLightGrey)
        }
        .foregroundStyle(.netflixWhite)
        .padding(10)
        .background(Color.netflixBlack.opacity(0.001))
        .onTapGesture {
            showPopover.toggle()
        }
        .popover(isPresented: $showPopover) {
            ZStack{
                Color.netflixDarkGrey
                
                HStack(spacing: 12){
                    ForEach(RateOption.allCases, id: \.self) { option in
                        rateButton(option: option)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)

            }
                .presentationCompactAdaptation(.popover)
        }
    }
    
    private func rateButton(option: RateOption) -> some View {
        VStack(spacing: 8){
            Image(systemName: option.iconName)
                .font(.title2)
            
            Text(option.title)
                .font(.caption)
        }
        .foregroundStyle(.netflixWhite)
        .padding(4)
        .background(Color.black.opacity(0.001))
        .onTapGesture {
            showPopover = false
            ratingSelected?(option)
        }
    }
    
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea(edges: .all)
        RateButton()
    }
}
