//
//  DTOs.swift
//  NewsApp
//
//  Created by blurfree on 8/23/24.
//

import Foundation

/// Success Response
struct NewsRespDTO: Decodable{
    
    let status: String
    let totalResults: Int
    let articles: [ArticleDTO]
}

extension NewsRespDTO {
    
    func toNews() -> News {
        
        return News(totalResults: self.totalResults,
                    articles: self.articles.map { $0.toArticle() })
    }
}

/// Error Response
struct ErrorRespDTO: Decodable, Error {
    
    let status: String
    let code: String
    let message: String
}

struct ArticleDTO: Decodable {
    
    let source: SourceDTO
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

extension ArticleDTO {
    
    func toArticle() -> Article {
        
        return Article(source: self.source.toSource(),
                       author: self.author,
                       title: self.title,
                       description: self.description,
                       url: self.url,
                       urlToImage: self.urlToImage,
                       publishedAt: self.publishedAt,
                       content: self.content)
    }
}

struct SourceDTO: Decodable {
    
    let id: String?
    let name: String
}

extension SourceDTO {
    
    func toSource() -> Source {
        
        return Source(id: self.id, name: self.name)
    }
}
