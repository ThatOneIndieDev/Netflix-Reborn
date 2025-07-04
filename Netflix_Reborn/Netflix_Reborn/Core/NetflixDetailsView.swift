//
//  NetflixDetailsView.swift
//  Netflix_Reborn
//
//  Created by Syed Abrar Shah on 29/05/2025.
//

import SwiftUI

struct NetflixDetailsView: View {
    
    var imageName: String = "detailImage"
    var progress: Double = 0.2
    @State private var isInMyList: Bool = false
    
    var body: some View {
        ZStack {
            Color.netflixBlack.edgesIgnoringSafeArea(.all)
            Color.netflixDarkGrey.opacity(0.3).ignoresSafeArea(.all)
            
            VStack(alignment: .leading ,spacing: 0){
                
                NetflixDetailsHeader(
                    imageName: imageName,
                    progress: progress) {
                        
                    } onXmarkPressed: {
                        
                    }
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading,spacing: 16) {
                        NetflixDetailsViewExtended()
                        
                        HStack(spacing: 32) {
                            myListButton(isInMyList: isInMyList) {
                                isInMyList.toggle()
                            }
                            
                            RateButton{ selection in
                                // do something to update data base when rated
                            }
                            
                            ShareButton()
                        }
                        .padding(.leading, 8)
                        
                        
                        VStack(alignment: .leading) {
                            Text("More like this")
                                .font(.headline)
                            
                            DetailGrid()
                        }
                        .foregroundStyle(.netflixWhite)
                        .padding(.leading, 8)
                    }
                    .padding(.top, 16)
                }



                
            }
        }
    }
}

#Preview {
    NetflixDetailsView()
}
