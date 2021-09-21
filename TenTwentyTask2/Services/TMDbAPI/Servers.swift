//
//  Servers.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import MCoreKit

extension ServerInfo {
    var url: URL? { return URL(string: baseURL) }
}

/// API Server information
struct TMDbAPIServer: ServerInfo {

    var baseURL: String {
        switch MConfig.defaultEnvironment {
        case .development: return "https://api.themoviedb.org/3"
        case .staging: return "https://api.themoviedb.org/3"
        case .production: return "https://api.themoviedb.org/3"
        }
    }

}

// We can setup multiple servers for different purpose
// Like Authentication server and Media server etc.

//struct TMDbAuthServer: ServerInfo { }

struct TMDbMediaServer: ServerInfo {

    var baseURL: String {
        switch MConfig.defaultEnvironment {
        case .development: return "https://image.tmdb.org/t/p/"
        case .staging: return "https://image.tmdb.org/t/p/"
        case .production: return "https://image.tmdb.org/t/p/"
        }
    }

}
