//
//  Models.swift
//  NewsApp
//
//  Created by blurfree on 8/25/24.
//

import Foundation

struct News {
    
    let totalResults: Int
    let articles: [Article]
}

struct Article: Hashable {
 
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct Source: Hashable {
    
    let id: String?
    let name: String
}
