//
//  URLSessionClient.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

struct NativeAPIClient: APIClient {
    private let baseURL = URL(string: "https://api.alhafez-almtmaez.com")!
    private let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func get<T: APIRequest>(_ request: T) async throws -> T.Response {
        guard
            var components = URLComponents(
                url: request.url,
                resolvingAgainstBaseURL: true
            )
        else { throw URLError(.badURL) }

                // 2. Add the query items
        components.queryItems = request.params
            .map { name, value in .init(name: name, value: value)}

        guard let url = components.url else {
            throw URLError(.badURL)
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        request.headers.forEach { header, value in
            urlRequest.setValue(value, forHTTPHeaderField: header)
        }

        let (data, response) = try await urlSession.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse, 
              (200...299).contains(httpResponse.statusCode) else {
            // TODO: improve error handling
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.Response.self, from: data)
    }
}
