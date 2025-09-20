//
//  ImageCacheClient.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

protocol ImageCacheClient {
    func cacheInMemory(from remoteURL: URL) async throws
}

extension ImageCacheClient where Self == KingfisherCacheClient {
    static var kingfisher: Self {
        .init()
    }
}
