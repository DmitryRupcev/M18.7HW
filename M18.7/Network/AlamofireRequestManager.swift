//
//  NetworkResource.swift
//  M18.7
//
//  Created by Дмитрий Рупцев on 06.05.2024.
//

import Foundation
import Alamofire
import UIKit

final class AlamofireRequestManager {
    
    // MARK: - Instants
    static let shared = AlamofireRequestManager()
    private init() {}
    
    private lazy var apiKey = Constants.Keys.API_Key
    private lazy var filmsURL = Constants.Link.filmsURL
    private lazy var detailURL = Constants.Link.detailURL
    private lazy var searchByKeywordURL = Constants.Link.searchByKeywordURL
    private lazy var topFilmsURL = Constants.Link.topFilmsURL
    
    // MARK: - Public methods
    
    public func searchMovies<T: Decodable>(by keyword: String, completion: @escaping (Result<T, Error>) -> Void) {
        var components = URLComponents(string: searchByKeywordURL)
        components?.queryItems = [URLQueryItem(name: "keyword", value: keyword)]
        
        guard let url = components?.url else {
            print("Something went wrong... \nCheck your URL")
            return
        }
        
        let headers: HTTPHeaders = [
            "X-API-KEY": apiKey
        ]
        
        AF.request(url, method: .get, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decodedData = try self.decodeData(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    public func getFilmInfo(by keyword: String, id: Int, completion: @escaping (Result<FilmInfo, Error>) -> Void) {
        let components = URLComponents(string: detailURL + "\(id)")
        guard let url = components?.url else {
            print("Something went wrong... \nCheck your URL")
            return
        }
        
        let headers: HTTPHeaders = [
            "X-API-KEY": apiKey
        ]
        
        AF.request(url, method: .get, headers: headers).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decodedData = try self.decodeData(FilmInfo.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    
    // MARK: - Private methods
    private func decodeData<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
