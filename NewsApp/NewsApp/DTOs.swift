//
//  DTOs.swift
//  NewsApp
//
//  Created by blurfree on 8/23/24.
//

import Foundation

protocol RespDTO {
    
    /// Read-Only Property
    var status: String { get }
}

/// Success Response
struct NewsRespDTO: Decodable, RespDTO {
    
    let status: String
    let totalResults: Int
    let articles: [ArticleDTO]
}

/// Error Response
struct ErrorRespDTO: Decodable, RespDTO {
    
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

struct SourceDTO: Decodable {
    
    let id: String?
    let name: String
}


