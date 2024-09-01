//
//  NewsTitleView.swift
//  NewsApp
//
//  Created by blurfree on 8/25/24.
//

import SwiftUI

struct NewsTitleView: View {
    
    /// scale per device
    @Environment(\.displayScale) var scale
    
    let article: Article

    var body: some View {
        
        VStack {
            
            if let image = article.urlToImage {
                
                AsyncImage(url: URL(string: image), scale: scale) { image in

                    image.resizable()
                        .cornerRadius(15)

                } placeholder: {
                    /// During loading Image
                    ProgressView()
                }
                .aspectRatio(contentMode: .fit)
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
            } else {
             
                Image("comebacktome")
                    .resizable()
                    .cornerRadius(15)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
            }

            Text(article.title)
                .font(Font.pretendard(.semibold, size: 24))
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
        }
        .frame(width: screenWidth - 30)
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray, lineWidth: 0.5)
        }
    }
}
