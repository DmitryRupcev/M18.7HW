//
//  URLSession.swift
//  M18.7
//
//  Created by Дмитрий Рупцев on 09.05.2024.
//

import Foundation
//import Alamofire

final class URLSessionManager {
    static let shared = URLSessionManager(); private init() { }
    let searchModel = SearchModel.self
    
    private lazy var apiKey = Constants.Keys.API_Key
    private lazy var filmsURL = Constants.Link.filmsURL
    private lazy var searchByKeywordURL = Constants.Link.searchByKeywordURL
    
    func getJson(by keyword: String, completion: @escaping (Result<SearchModel, Error>) -> ()) {
        
        //
        var components = URLComponents(string: searchByKeywordURL)
        components?.queryItems = [URLQueryItem(name: "keyword", value: keyword)]
        
        //
        guard let url = components?.url else {
            print("Something went wrong... \nCheck your URL")
            return
        }
        
        //
        if components != nil {
            //
            var request = URLRequest(url: url)
            request.addValue(apiKey, forHTTPHeaderField: "X-API-KEY")
            request.httpMethod = "GET"
            
            //
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(self.searchModel, from: data)
                        completion(.success(json))
                    } catch {
                        let error = Constants.NetworkError.decodingError
                        completion(.failure(error))
                        print(error.localizedDescription, "\(error)")
                    }
                }
            }
            task.resume()
        }
    }
    
}
