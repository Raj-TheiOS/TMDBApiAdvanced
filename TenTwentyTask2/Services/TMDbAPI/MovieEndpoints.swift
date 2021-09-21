//
//  MovieEndpoints.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import MCoreKit

/// TMDb Movie api, currently implementing only 2 endpoints
enum TMDbMovieAPI {
    case popular
    case movieDetails(_ id: Int)
    case movieVideos(_ id: Int)
}

/// Implementation of the API Endpoint protocol
extension TMDbMovieAPI: NetworkEndpoint {
    // All endpoints currently implemented are using GET
    // So it is possible to implement `HTTPGetEndPoint` and save some code

    var server: ServerInfo {
        // Already configured based on environment settings.
        return MConfig.Servers.api
    }

    var httpMethod: String { return .HTTPGet }

    var path: String {
        switch self {
        case .popular: return "/movie/popular"
        case .movieDetails(let id): return "/movie/\(id)"
        case .movieVideos(let id): return "/movie/\(id)/videos"
        }
    }

    var parameters: Params? {
        return ["api_key": "30e4e0a732822658641a261c013c8599"]
    }

    var encoding: NetworkEncoding { return .url }

}
