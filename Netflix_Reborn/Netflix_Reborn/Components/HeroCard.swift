//
//  HeroCard.swift
//  Netflix_Reborn
//
//  Created by Syed Abrar Shah on 28/05/2025.
//

import SwiftUI

struct HeroCard: View {

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack {
                Spacer()

                ZStack(alignment: .bottom) {
                    // Background Image
                    Image("HeroImage")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 500)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [.clear, .black.opacity(0.8)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        )

                    // Top-left N FILM label
                    VStack {
                        HStack {
                            Text("N")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.red)
                            Text("FILM")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.top, 20)
                        .padding(.leading, 16)
                        Spacer()
                    }
                    .frame(width: 350, height: 500)

                    // Bottom content
                    VStack(spacing: 10) {
                        Text("Reverse 1999")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        Text("Bluepoch Creations")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.85))

                        HeroCardTab()
                            .padding(.bottom)
                    }
                    .frame(width: 300)
                }

                Spacer()
            }

        }
        .frame(width: 350, height: 500)
        .contentShape(Rectangle())
    }
}


#Preview {
    
    ZStack {
        Color.black.ignoresSafeArea(edges: .all)
        HeroCard()
    }
    

}
