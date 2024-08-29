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
                .frame(width: screenWidth, height: screenWidth / 7)
                
                ScrollView(showsIndicators: false) {
                    
                    LazyVStack {
                        ForEach(headlineVM.news.articles, id: \.self.source.id) { article in
                            
                            NewsTitleView(image: article.urlToImage ?? "", title: article.title)
                                .onTapGesture {
                                    
                                }
                            
                        }
                    }
                }
                
                Spacer()
                
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
