//
//  APIError.swift
//  CoreModule
//
//  Created by Ahmed Shendy on 08/07/2024.
//  Copyright © 2024 Semicolon. All rights reserved.
//

import Foundation

// swiftlint:disable identifier_name
public enum APIError: ApplicationError {
    case FailedResponse(_ message: String)
    case UnauthorizedRequest(_ message: String)
    case FalseResponseStatus(_ message: String)
    case MissingResponseData
    case FailedResponseSerialization(_ debugMessage: String)
    case InvalidUrl(_ url: String)
    case FailedRequest(_ debugMessage: String)
    case RequestTimeOut(_ debugMessage: String)
    case NoNetworkConnection(_ debugMessage: String)
    case NetworkError(_ debugMessage: String)

    public var details: ErrorDetails {
        switch self {
        case .FailedResponse(let message):
            return .init(
                type: self.identifier,
                message: message,
                debugMessage: message
            )

        case .UnauthorizedRequest(let message):
            return .init(
                type: self.identifier,
                message: message,
                debugMessage: message
            )

        case .FalseResponseStatus(let message):
            return .init(
                type: self.identifier,
                message: message,
                debugMessage: message
            )

        case .MissingResponseData:
            let message = String.error.MissingResponseData

            return .init(
                type: self.identifier,
                message: message,
                debugMessage: message
            )

        case .FailedResponseSerialization(let debugMessage):
            let message = String.error.ResponseSerialization

            return .init(
                type: self.identifier,
                message: message,
                debugMessage: debugMessage
            )

        case .InvalidUrl(let url):
            let message = String.error.InvalidAPIUrl

            return .init(
                type: self.identifier,
                message: message,
                debugMessage: "Invalid url: \(url)"
            )

        case .FailedRequest(let debugMessage):
            let message = String.error.InvalidAPIUrl

            return .init(
                type: self.identifier,
                message: message,
                debugMessage: debugMessage
            )

        case .RequestTimeOut(let debugMessage):
            let message = String.error.RequestTimeOut

            return .init(
                type: self.identifier,
                message: message,
                debugMessage: debugMessage
            )

        case .NoNetworkConnection(let debugMessage):
            let message = String.error.NoNetworkConnection

            return .init(
                type: self.identifier,
                message: message,
                debugMessage: debugMessage
            )

        case .NetworkError(let debugMessage):
            let message = String.error.NetworkError

            return .init(
                type: self.identifier,
                message: message,
                debugMessage: debugMessage
            )
        }
    }
}
// swiftlint:enable identifier_name
