//
//  APIRequest.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

protocol APIRequest {
    associatedtype Response: Decodable

    var api: URL { get }
    var path: String { get }
    var headers: [String: String] { get }
    var params: [String : String] { get }
    var method: String { get }
    var body: Encodable? { get }
}

extension APIRequest {
    var params: [String : String] { [:] }
    var body: Encodable? { nil }
    var url: URL { api.appendingPathComponent(path) }
}
