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
    
    /// NewsImage
    let image: String
    /// NewsTitle
    let title: String
    
    var body: some View {
        
        NavigationLink(destination: NewsContentView()) {
            
            VStack {

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
                
                Text(title)
                    .font(Font.pretendard(.bold, size: 24))
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
}

#Preview {
    NewsTitleView(image: "https://picsum.photos/id/12/200", title: "What happens if the text becomes extremely long?")
}
