//
//  URLSession.swift
//  M18.7
//
//  Created by Дмитрий Рупцев on 09.05.2024.
//

import Foundation

class URLSessionManager {
    static let shared = URLSessionManager(); private init() { }
    let searchModel = SearchModel.self
    
    func fetchData(completion: @escaping (Result<SearchModel, Error>) -> ()) {
        //
        guard let url = Constants.Link.createURL() else {
            completion(.failure(Constants.NetworkingError.badUrl))
            return
        }
        
        //
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                if let error {
                    completion(.failure(error))
                }
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let userData = try decoder.decode(self.searchModel, from: data)
                completion(.success(userData))
            } catch {
                completion(.failure(Constants.NetworkingError.invalidData))
            }
            
        }.resume()
    }
}
