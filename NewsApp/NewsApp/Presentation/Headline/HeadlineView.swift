//
//  HeadlineView.swift
//  NewsApp
//
//  Created by blurfree on 8/23/24.
//

import SwiftUI

struct HeadlineView: View {
    
    @StateObject var headlineVM: HeadlineViewModel = .init()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                HStack {
                    
                    Text("The News")
                        .font(Font.pretendard(.bold, size: 18))
                    
                }
                .frame(width: screenWidth, height: screenWidth / 8)
                
                ScrollView(showsIndicators: false) {
                    
                    ForEach(headlineVM.news.articles, id: \.self) { article in
                        
                        NavigationLink(destination: NewsContentView(article: article)) {
                            
                            NewsTitleView(article: article)
                        }
                    }
                }
            }
            .background(Color(hex: 0xF5F5F5))
        }
        .onAppear {
            
            headlineVM.fetchData(newsType: .headlines(country: "us", category: "business"))
            
        }
        
    }
}

#Preview {
    HeadlineView()
}
