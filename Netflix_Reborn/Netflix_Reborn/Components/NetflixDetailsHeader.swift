//
//  NetflixDetailsHeader.swift
//  Netflix_Reborn
//
//  Created by Syed Abrar Shah on 29/05/2025.
//

import SwiftUI
import SwiftfulUI

struct NetflixDetailsHeader: View {
    
    
    var imageName: String = "detailImage"
    var progress: Double = 0.2
    var onAirplayPressed: (() -> Void)? = nil
    var onXmarkPressed: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .bottom){
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .clipped()
            
            CustomProgressBar(
                selection: progress,
                range: 0...1,
                backgroundColor: .netflixLightGrey,
                foregroundColor: .netflixRed,
                cornerRadius: 2,
                height: 4
            )
            .padding(.horizontal, 4)
            .padding(.bottom, 4)
            .animation(.linear, value: progress)
            

            detailHeader
            
        }
        .aspectRatio(2, contentMode: .fit)
        .shadow(radius: 4)
    }
    
    private var detailHeader: some View {
        HStack(spacing: 8){
            Circle()
                .fill(.netflixDarkGrey)
                .frame(width: 36, height:36)
                .overlay(
                    Image(systemName: "tv.badge.wifi")
                        .foregroundStyle(.netflixWhite)
                        .offset(y: 1)
                )
                .onTapGesture {
                    onAirplayPressed?()
                }
            
            Circle()
                .fill(.netflixDarkGrey)
                .frame(width: 36, height:36)
                .overlay(
                    Image(systemName: "xmark")
                        .foregroundStyle(.netflixWhite)
                        .offset(y: 1)
                )
                .onTapGesture {
                    onXmarkPressed?()
                }
        }
        .frame(maxWidth: .infinity ,maxHeight: .infinity, alignment: .topTrailing)
        .padding(.trailing, 8)
        .padding(.top, 8)
        .fontWeight(.bold)
        
    }
    
}


#Preview {
    NetflixDetailsHeader()
}
