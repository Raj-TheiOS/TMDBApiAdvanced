//
//  MovieStub.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import MCoreKit

/// Stub support by implementing StubbedEndpoint protocol
extension TMDbMovieAPI: StubbedEndpoint {

    class StubBundle { }

    public var data: Data? {
        let bundle = Bundle(for: StubBundle.self)
        switch self {
        case .popular:
            if let url = bundle.url(forResource: "popular", withExtension: "json") {
                return try? Data(contentsOf: url)
            }
        case .movieDetails(let id):
            if let url = bundle.url(forResource: "movie\(id)", withExtension: "json") {
                return try? Data(contentsOf: url)
            }
        case .movieVideos(let id):
            if let url = bundle.url(forResource: "movieVideos\(id)", withExtension: "json") {
                return try? Data(contentsOf: url)
            }
        }
        return nil
    }

    public var error: Error? {
        return nil
    }

}
