//
//  SplashView.swift
//  NewsApp
//
//  Created by blurfree on 8/23/24.
//

import SwiftUI

struct SplashView: View {
    
    /// Moving on the next screen or not
    @State var goToNextView: Bool = false
    /// changing the backscreen color
    @State var backscreenColor: Color = .black
    
    var body: some View {
        
        ZStack {
            
            backscreenColor
            
            if goToNextView {
                
                BasicTabView()
                
            } else {
        
                Text("Economic News")
                    .foregroundStyle(backscreenColor == .black ? .white : .black)
                    .font(Font.pretendard(.bold, size: 30))
            }
        }
        .ignoresSafeArea()
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                withAnimation {
                    backscreenColor = .white
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                
                // moving on the next screen after 3 seconds
                goToNextView = true
            }
        }
    }
}

#Preview {
    SplashView()
}
