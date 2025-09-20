//
//  KingfisherCacheClient.swift
//  TMDB BB4it
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
                        // The image is now in the cache. We can successfully resume.
                        continuation.resume()
                    case .failure(let error):
                        // If Kingfisher fails, we throw the error.
                        continuation.resume(throwing: error)
                    }
                }
            )
        }
    }
}
