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
        
        Text("Headline")
        
    }
}

#Preview {
    HeadlineView()
}
