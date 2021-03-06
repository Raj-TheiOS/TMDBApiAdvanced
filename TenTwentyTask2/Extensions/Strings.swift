//
//  Strings.swift
//  TenTwentyTask2
//
//  Created by Arjun  on 03/01/20.
//  Copyright © 2020 Raj. All rights reserved.
//

import MCoreKit

/// Utility extension to provide constants etc.
extension String {
    // Default Domain for this app
    static let AppDomain = "com.yasirmturk.Movies24i"

    //
    static let Movies24i = "Movies 24i".localized

    //
    static let MovieCatalogue = "Movie Catalogue".localized
    static let PullToLoad = "Pull to Load".localized
    static let MovieDetail = "Movie Detail".localized
    static let WatchTrailer = "Watch Trailer".localized
    static let Genres = "Genres".localized
    static let Date = "Date".localized
    static let Overview = "Overview".localized
    static let Connected = "Connected".localized

    // Error messages
    static let ErrorReachability = "Unable to start reachability for server".localized
    static let ErrorNetwork = "No network connection".localized
    static let ErrorNotEnoughData = "The api did not provide any data".localized
    static let ErrorAPI = "The api is not working".localized
    static let ErrorClient = "The request is not valid".localized
    static let ErrorData = "The api sent invalid data".localized
    static let ErrorResponse = "The api sent invalid response".localized
}
