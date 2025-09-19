//
//  MovieListResponse.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

protocol MovieListResponse {
    var page: Int { get }
    var results: [MovieModel] { get }
    var total_pages: Int { get }
    var total_results: Int { get }
}
