//
//  ModelNetwork.swift
//  M18.7
//
//  Created by Дмитрий Рупцев on 05.05.2024.
//

import Foundation
 
struct SearchModel: Codable {
    let keyword: String?
    let pagesCount: Int?
    let films: [Film]
    let searchFilmCountResult: Int?
}

struct Film: Codable {
    let filmId: Int?
    let nameRu: String?
    let year: String?
    let description: String?
    let filmLength: String?
    let rating: String?
    let ratingVoteCount: Int?
    let posterUrl: String?
    let posterUrlPreview: String?
}
