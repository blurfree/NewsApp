//
//  NewsContentView.swift
//  NewsApp
//
//  Created by blurfree on 8/26/24.
//

import SwiftUI

struct NewsContentView: View {
    
    let article: Article
    
    var body: some View {
        
        ScrollView {
         
            VStack {
                
                Text(article.title)
                    .font(Font.pretendard(.bold, size: 28))
                
                HStack {
                    
                    Text("By")
                        .font(Font.pretendard(.regular, size: 15))
                        .foregroundStyle(.gray)
                    
                    Text(article.author ?? "unknown")
                        .font(Font.pretendard(.regular, size: 15))
                        .foregroundStyle(.black)
                    
                    Text("From")
                        .font(Font.pretendard(.regular, size: 15))
                        .foregroundStyle(.gray)
                        
                    
                    Text("\(article.source.name)")
                        .font(Font.pretendard(.regular, size: 15))
                        .foregroundStyle(.gray)
                    
                    Spacer(minLength: 0)
                    
                }
                
                HStack {
                    
                    Text("PublishedAt")
                        .font(Font.pretendard(.regular, size: 15))
                        .foregroundStyle(.gray)
                    
                    Text(article.publishedAt)
                        .font(Font.pretendard(.regular, size: 15))
                        .foregroundStyle(.black)
                        
                    Spacer()
                    
                }
                
            }
            .padding(.horizontal, 20)
            
            Image("comebacktome")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenWidth)
            
            VStack(alignment: .leading) {
                
                Text(article.content ?? "No Content")
                    .font(Font.pretendard(.regular, size: 18))
                
            }
            .padding(.horizontal, 20)
            
        }
    }
}
