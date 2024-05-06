//
//  AlamofireRequest.swift
//  M18.7
//
//  Created by Дмитрий Рупцев on 24.04.2024.
//

import Foundation
import Alamofire

final class AlamofireRequest {
    
    let url = "https://kinopoiskapiunofficial.tech/api/v2.2/films/301"
    let key = "7d9e9573-883c-4684-9ca5-bd6a76f118b6"
    
    func urlRequest(url: String) {
        AF.request(url).responseJSON { response in
            print("")
        }
    }
}
