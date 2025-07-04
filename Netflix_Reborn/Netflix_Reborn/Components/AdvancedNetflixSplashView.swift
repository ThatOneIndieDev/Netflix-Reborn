//
//  AdvancedNetflixSplashView.swift
//  Netflix_Reborn
//
//  Created by Syed Abrar Shah on 29/05/2025.
//

import SwiftUI

struct AdvancedNetflixSplashView: View {
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 1.0
    @State private var isComplete = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            // Netflix "N" with gradient
            Text("N")
                .font(.system(size: 100, weight: .black))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.netflixRed, .netflixDarkRed],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .scaleEffect(scale)
                .opacity(opacity)
                .shadow(color: .netflixRed.opacity(0.7), radius: 20, x: 0, y: 0)
            
            if isComplete {
                // Your main content transition
                ContentView()
                    .transition(.opacity)
            }
        }
        .onAppear(perform: animateLogo)
    }
    
    private func animateLogo() {
        // Initial pulse
        withAnimation(.easeInOut(duration: 0.3).delay(0.1)) {
            scale = 1.2
        }
        
        // Return to normal size
        withAnimation(.easeInOut(duration: 0.4).delay(0.4)) {
            scale = 1.0
        }
        
        // Fade out
        withAnimation(.easeIn(duration: 0.3).delay(1.0)) {
            opacity = 0
            scale = 1.5
        }
        
        // Mark complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation {
                isComplete = true
            }
        }
    }
}

#Preview {
    AdvancedNetflixSplashView()
}
