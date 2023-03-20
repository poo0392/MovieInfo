//
//  MovieDetailModel.swift
//  KinkreeTest
//
//  Created by Administrator on 20/03/23.
//

import UIKit


struct MovieDetailModel: Codable {
    var title, year : String?
    var poster,response: String?
    var ratings: [Rating]?
  
   
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case ratings = "Ratings"
        case response = "Response"
    }
    init(){
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        year = try values.decodeIfPresent(String.self, forKey: .year)
        ratings = try values.decodeIfPresent([Rating].self, forKey: .ratings)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        poster = try values.decodeIfPresent(String.self, forKey: .poster)
    }
}

// MARK: - Rating
struct Rating: Codable {
    let source, value: String

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
