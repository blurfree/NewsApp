//
//  BasicTabView.swift
//  NewsApp
//
//  Created by blurfree on 8/23/24.
//

import SwiftUI

struct BasicTabView: View {
    /// TabView Binding Number
    @State var tabViewNumber = 0
    
    var body: some View {
        
        TabView(selection: $tabViewNumber) {
            
            HeadlineView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            SourceView()
                .tabItem {
                    Image(systemName: "newspaper")
                }
                .tag(2)
        }
        .accentColor(.black)
    }
}

#Preview {
    BasicTabView()
}
