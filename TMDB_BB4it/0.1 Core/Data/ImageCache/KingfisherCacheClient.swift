//
//  KingfisherCacheClient.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation
import Kingfisher

final class KingfisherCacheClient: ImageCacheClient {
    func cacheInMemory(from remoteURL: URL) async throws {
        try await withCheckedThrowingContinuation { continuation in
            KingfisherManager.shared.retrieveImage(
                with: remoteURL,
                completionHandler: { result in
                    switch result {
                    case .success:
                        continuation.resume()
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            )
        }
    }
}
