//
//  MovieResult.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import MCoreKit

/// To parse the API result from movie list
struct MovieResult {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [Movie]
}

/// Implementation of Decodable
extension MovieResult: Model {

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        page = try container.decode(Int.self, forKey: .page)
        totalPages = try container.decode(Int.self, forKey: .totalPages)
        totalResults = try container.decode(Int.self, forKey: .totalResults)
        results = try container.decode([Movie].self, forKey: .results)
    }

}
