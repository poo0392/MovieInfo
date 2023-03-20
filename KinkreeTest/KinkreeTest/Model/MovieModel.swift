//
//  MovieModel.swift
//  KinkreeTest
//
//  Created by Administrator on 16/03/23.
//

import UIKit

struct MovieModel: Codable {
    let search: [SearchModel]?
    let totalResults, response: String?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults = "totalResults"
        case response = "Response"
    }
}
struct SearchModel: Codable {
    let title, year, imdbID: String?
    let type: String?
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
