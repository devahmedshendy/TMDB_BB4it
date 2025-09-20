//
//  NativeAPIClient.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

struct NativeAPIClient: APIClient {
    private let urlSession: URLSession
    private let decoder: JSONDecoder = .init()

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func get<T: APIRequest>(_ request: T) async throws -> T.Response {
        func buildURL(from request: T) throws -> URL {
            guard var components = URLComponents(url: request.url, resolvingAgainstBaseURL: true) else {
                throw APIError.InvalidUrl(request.url.absoluteString)
            }

            components.queryItems = request.params.map { URLQueryItem(name: $0.key, value: $0.value) }

            guard let url = components.url else {
                throw APIError.InvalidUrl("Could not form URL from components for path: \(request.url.path)")
            }

            return url
        }

        do {
            let url = try buildURL(from: request)
            let urlRequest = buildURLRequest(from: request, httpMethod: .httpMethod.GET, url: url)
            let data = try await executeRequest(for: urlRequest)
            return try decode(from: data, as: T.Response.self)

        } catch let error {
            throw (error as? APIError) ?? mapSystemError(error)
        }
    }

    private func buildURLRequest<T: APIRequest>(from request: T, httpMethod: String, url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod
        request.headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        return urlRequest
    }

    private func executeRequest(for urlRequest: URLRequest) async throws -> Data {
        let (data, response) = try await urlSession.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse else {
            // This is an unusual case, but good to handle.
            throw APIError.NetworkError("Response was not an HTTPURLResponse.")
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            // Here, we can inspect the status code for more detail
            switch httpResponse.statusCode {
            case 401:
                throw APIError.UnauthorizedRequest("Authentication failed.")

            case 400...499:
                throw APIError.FailedResponse("Client error with status code: \(httpResponse.statusCode)")

            case 500...599:
                throw APIError.NetworkError("Server error with status code: \(httpResponse.statusCode)")

            default:
                throw APIError.NetworkError("Unhandled HTTP status code: \(httpResponse.statusCode)")
            }
        }

        return data
    }

    private func decode<T: Decodable>(from data: Data, as type: T.Type) throws -> T {
        do {
            return try decoder.decode(T.self, from: data)
        } catch let decodingError {
            throw APIError.FailedResponseSerialization(decodingError.localizedDescription)
        }
    }

    private func mapSystemError(_ error: Error) -> APIError {
        // Handle URLErrors, which are the most common from URLSession
        if let urlError = error as? URLError {
            switch urlError.code {
            case .notConnectedToInternet, .networkConnectionLost:
                return APIError.NoNetworkConnection(urlError.localizedDescription)

            case .timedOut:
                return APIError.RequestTimeOut(urlError.localizedDescription)

            case .badURL:
                return APIError.InvalidUrl(urlError.localizedDescription)

            default:
                return APIError.NetworkError(urlError.localizedDescription)
            }
        }

        // Handle other potential system errors
        return APIError.NetworkError(error.localizedDescription)
    }
}
