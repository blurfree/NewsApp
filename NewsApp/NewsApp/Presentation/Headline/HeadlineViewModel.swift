//
//  HeadlineViewModel.swift
//  NewsApp
//
//  Created by blurfree on 8/25/24.
//

import Foundation

class HeadlineViewModel: ObservableObject {
    
    let nm = NetworkManager.shared
    
    @Published var news: News = News(totalResults: 0, articles: [])
    
    @Published var networkErrorMessage: Bool = false
    
    func fetchData(newsType: NewsType) {
        
        nm.fetchData(newsType: newsType) { data, error in
            
            guard let data = data else {
                
                /// notification network error message
                self.networkErrorMessage = true
                
                return
            }
            
            let result = JSONDecoder().customDecode(data: data)
            
            switch result {
                
            case .success(let newsRespDTO):
                
                DispatchQueue.main.async {
                    print("headlineVM called")
                    
                    self.news = newsRespDTO.toNews()
                    
                    print("\(self.news.totalResults)")
                }
                
            case .failure(let errorRespDTO):
                
                _ = errorRespDTO
                
            }
        }
    }
}
