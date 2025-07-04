//
//  NetflixHomeView.swift
//  Netflix_Reborn
//
//  Created by Syed Abrar Shah on 28/05/2025.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct NetflixHomeView: View {
    
    @Environment(\.router) var router
    
    @State private var scrollViewOffset: CGFloat = 0
    @State private var selectedFilter: FilterModel? = nil
    let filters: [FilterModel] = FilterModel.mockArray
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            
            // Main content with scroll view
            ScrollViewWithOnScrollChanged(
                .vertical,
                showsIndicators: false
            ) {
                VStack(spacing: 0) {
                    Color.clear
                        .frame(height: 60) // Match your header height
                    
                    VStack(spacing: 0) {
                        if scrollViewOffset > -20 {
                            NetflixBarView(
                                filters: filters,
                                selectedFilter: selectedFilter,
                                filterPressed: { newFilter in
                                    selectedFilter = newFilter
                                },
                                onXMarkTapped: {
                                    selectedFilter = nil
                                }
                            )
                            .padding(.top, 16)
                            .transition(.move(edge: .top).combined(with: .opacity))
                        } else {
                            Color.clear
                                .frame(height: 50)
                                .padding(.top, 16)
                        }
                    }
                    .animation(.smooth, value: scrollViewOffset)

                    HeroCard()
                        .padding(.top, 16)
                    
                    VStack(spacing: 16) {
                        GridView()
                    }
                    
                    Spacer()
                }
            } onScrollChanged: { origin in
                scrollViewOffset = origin.y
                print("Scroll offset: \(origin.y)")
            }
            
            // Fixed header overlay
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
                    .background(
                        Color.netflixBlack
                            .ignoresSafeArea(edges: .top)
                            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 2)
                    )
                
                Spacer()
            }
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private func onStoryPressed(){
        router.showScreen(.sheet) { _ in
            NetflixDetailsView()
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .onTapGesture {
                    router.dismissScreen()
                }

            HStack(spacing: 30) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        // Action
                    }
                
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        // Action
                    }
            }
        }
        .frame(height: 60) // Explicit height for header
    }
}



#Preview {
    ZStack{
        Color.netflixBlack.ignoresSafeArea(.all)
        NetflixHomeView()
    }
}
