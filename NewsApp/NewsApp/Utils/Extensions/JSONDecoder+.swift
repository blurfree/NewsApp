//
//  JSONDecoder+.swift
//  NewsApp
//
//  Created by blurfree on 8/25/24.
//

import Foundation

extension JSONDecoder {
    
    /// Custom Decoder
    func customDecode(data: Data) -> Result<NewsRespDTO, ErrorRespDTO> {
     
        let decoder = JSONDecoder()
        
        /// Success Response
        /// trying to decode as NewsRespDTO
        if let successResponse = try? decoder.decode(NewsRespDTO.self, from: data) {
            
            return .success(successResponse)
        }
        
        /// Error Response
        /// If decoding as NewsRespDTO fails, try decoding as ErrorRespDTO
        if let errorResponse = try? decoder.decode(ErrorRespDTO.self, from: data) {
            
            return .failure(errorResponse)
        }
        
        /// if neither decoding works
        let unknownError = ErrorRespDTO(status: "error", code: "unknownError", message: "UnknownError")
        return .failure(unknownError)
        
    }
}
