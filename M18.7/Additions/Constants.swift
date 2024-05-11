//
//  Constants.swift
//  M18.7
//
//  Created by Дмитрий Рупцев on 05.05.2024.
//

import Foundation
import UIKit

enum Constants {
    
    enum NetworkingError: Error {
        case badUrl, badRequest, badResponse, invalidData
    }
    
    //MARK: - Color
    enum Color {
        static let textColorDark = #colorLiteral(red: 0.1393499672, green: 0.149340719, blue: 0.1577528417, alpha: 1)
        static let textColorWhite = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        static let textColorSystemGray = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    //MARK: - Fonts
    enum Fonts {
        static let primaryFont = UIFont.systemFont(ofSize: 22.0)
        static let secondaryFont = UIFont.systemFont(ofSize: 20.0)
        static let header = UIFont.boldSystemFont(ofSize: 26.0)
    }
    
    //MARK: - Link
    enum Link {
        static let filmsURL = "https://kinopoiskapiunofficial.tech/api/v2.1/films/"
        static let detailURL = "https://kinopoiskapiunofficial.tech/api/v2.2/films/"
        static let searchByKeywordURL = filmsURL + "search-by-keyword?keyword"
        static let topFilmsURL = filmsURL + "top?type"
        
        static func createURL() -> URL? {
            let url = URL(string: searchByKeywordURL)
            return url
        }
        
    }
    
    //MARK: - API Key
    enum Keys {
        static let API_Key = "7d9e9573-883c-4684-9ca5-bd6a76f118b6"
    }
}
