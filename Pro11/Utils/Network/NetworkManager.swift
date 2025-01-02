//
//  NetworkManager.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import Foundation
import Combine

enum NetworkError: Error, CustomStringConvertible {
    case invalidURL
    case serverError(statusCode: Int, data: Data?)
    case decodingError
    case encodingError
    case unknown
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .serverError(let statusCode, let data):
            let serverMessage = data.flatMap { String(data: $0, encoding: .utf8) } ?? "No response body."
            return "Server error (status code: \(statusCode)). Message: \(serverMessage)"
        case .decodingError:
            return "Failed to decode the response."
        case .encodingError:
            return "Failed to encode the request body."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    private let session = URLSession.shared
    
    private init() {}
    
    func request<T: Decodable>(route: NetworkRoute, responseType: T.Type) -> AnyPublisher<T, NetworkError> {
        guard let url = route.url() else {
            printLog("❌ Invalid URL", type: .error)
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }
        
        do {
            let request = try buildRequest(for: route, url: url)
            printRequestLog(request)
            
            return session.dataTaskPublisher(for: request)
                .tryMap { try self.validateResponse($0) }
                .decode(type: T.self, decoder: JSONDecoder())
                .handleEvents(receiveOutput: { decodedResponse in
                    self.logDecodedResponse(decodedResponse)
                })
                .mapError { self.mapError($0) }
                .receive(on: DispatchQueue.main) // Ensure UI updates occur on the main thread
                .handleEvents(receiveSubscription: { _ in
                    self.printLog("📡 Request Sent", type: .info)
                    
                })
                .eraseToAnyPublisher()
        } catch {
            printLog("❌ Failed to build request: \(error)", type: .error)
            return Fail(error: .encodingError).eraseToAnyPublisher()
        }
    }
    
    // MARK: - Helper Methods
    
    private func buildRequest(for route: NetworkRoute, url: URL) throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = route.method.rawValue
        
        // Add headers
        if let headers = route.headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        
        request.addValue("Bearer \(UserStorage.token)", forHTTPHeaderField: "Authorization")
        printLog("📋 [Authorization] Bearer \(UserStorage.token)", type: .debug)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Add body if applicable
        if let requestBody = route.body, route.method == .post || route.method == .put {
            do {
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                let bodyData = try encoder.encode(requestBody)
                request.httpBody = bodyData
            } catch {
                throw NetworkError.encodingError
            }
        }
        
        return request
    }
    
    private func validateResponse(_ output: URLSession.DataTaskPublisher.Output) throws -> Data {
        if let httpResponse = output.response as? HTTPURLResponse {
            printLog("🔄 [Response] Status Code: \(httpResponse.statusCode)", type: .info)
            printLog("📋 [Response Headers]: \(httpResponse.allHeaderFields)", type: .debug)
            
            if !(200..<300).contains(httpResponse.statusCode) {
                throw NetworkError.serverError(statusCode: httpResponse.statusCode, data: output.data)
            }
        }
        return output.data
    }
    
    private func mapError(_ error: Error) -> NetworkError {
        if let networkError = error as? NetworkError {
            return networkError
        } else if let decodingError = error as? DecodingError {
            logDecodingError(decodingError)
            return .decodingError
        } else {
            return .unknown
        }
    }
    
    private func logDecodingError(_ error: DecodingError) {
        switch error {
        case .keyNotFound(let key, let context):
            printLog("❌ Decoding Error: Key '\(key.stringValue)' not found. Context: \(context.debugDescription)", type: .error)
        case .typeMismatch(let type, let context):
            printLog("❌ Decoding Error: Type mismatch for type '\(type)'. Context: \(context.debugDescription)", type: .error)
        case .valueNotFound(let type, let context):
            printLog("❌ Decoding Error: Value not found for type '\(type)'. Context: \(context.debugDescription)", type: .error)
        case .dataCorrupted(let context):
            printLog("❌ Decoding Error: Data corrupted. Context: \(context.debugDescription)", type: .error)
        @unknown default:
            printLog("❌ Decoding Error: Unknown error occurred during decoding.", type: .error)
        }
    }
    
    
    private func printRequestLog(_ request: URLRequest) {
        printLog("🌐 [Request] \(request.httpMethod ?? "UNKNOWN") \(request.url?.absoluteString ?? "Invalid URL")", type: .info)
        if let headers = request.allHTTPHeaderFields {
            for (key, value) in headers {
                printLog("📋 [Header] \(key): \(value)", type: .debug)
            }
        }
        if let body = request.httpBody, let bodyString = String(data: body, encoding: .utf8) {
            printLog("📦 [Request Body]: \(bodyString)", type: .debug)
        }
    }
    
    private func printLog(_ message: String, type: LogType) {
        switch type {
        case .info:
            print("ℹ️ \(message)")
        case .error:
            print("❌ \(message)")
        case .debug:
            print("🐛 \(message)")
        }
    }
    private func logDecodedResponse<T: Decodable>(_ response: T) {
        if let encodableResponse = response as? Encodable {
            do {
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                let responseData = try encoder.encode(encodableResponse)
                if let jsonString = String(data: responseData, encoding: .utf8) {
                    printLog("📦 [Decoded Response]: \(jsonString)", type: .debug)
                }
            } catch {
                printLog("🐛 Failed to log decoded response: \(error)", type: .error)
            }
        } else {
            printLog("⚠️ Response type is not Encodable, skipping log.", type: .debug)
        }
    }


}

// MARK: - Logging Types
enum LogType {
    case info, error, debug
}
