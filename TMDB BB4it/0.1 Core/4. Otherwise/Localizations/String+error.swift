//
//  String+text.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

extension String.error {
    static var Unknown: String { "An unexpected error occurred" }
    static var InvalidAPIUrl: String { "Invalid URL address" }
    static var MissingResponseData: String { "Failed to get data from the server." }
    static var FailedRequest: String { "Unable to connect to server" }
    static var RequestTimeOut: String { "Request timed out. Please try again" }
    static var NoNetworkConnection: String { "No internet connection" }
    static var NetworkError: String { "A network error occurred" }
    static var ResponseSerialization: String { "Unable to process server response" }
}
