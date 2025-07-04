//
//  myListButton.swift
//  Netflix_Reborn
//
//  Created by Syed Abrar Shah on 29/05/2025.
//

import SwiftUI

struct myListButton: View {
    
    var isInMyList: Bool = false
    var onButtonTapped: (() -> Void)? = nil
    
    
    var body: some View {
        VStack(spacing: 8){
            
            ZStack{
                Image(systemName: "checkmark")
                    .opacity(isInMyList ? 1 : 0)
                    .rotationEffect(Angle(degrees: isInMyList ? 0 : 180))
                
                Image(systemName: "plus")
                    .opacity(isInMyList ? 0 : 1)
                    .rotationEffect(Angle(degrees: isInMyList ? -180 : 0))

            }
            .font(.title)


            Text("My List")
                .font(.caption)
                .foregroundStyle(.netflixLightGrey)
        }
        .foregroundStyle(.netflixWhite)
        .padding(10)
        .background(Color.netflixBlack.opacity(0.001))
        .animation(.bouncy, value: isInMyList)
        .onTapGesture {
                onButtonTapped?()
        }
    }
}

fileprivate struct myListButtonPreview: View{
    @State private var isInMyList: Bool = false
    
    var body: some View{
        myListButton(isInMyList: isInMyList){
            isInMyList.toggle()
        }
    }
}

#Preview {
    ZStack{
        Color.netflixBlack.ignoresSafeArea(edges: .all)
        myListButtonPreview()
    }
    
}
