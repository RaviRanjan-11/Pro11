//
//  NetworkRoute.swift
//  Pro11
//
//  Created by Ravi Ranjan on 21/12/24.
//

import Foundation


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol NetworkRoute {
    /// The endpoint path for the network request.
    var path: String { get }
    
    /// The HTTP method to use for the request.
    var method: HTTPMethod { get }
    
    /// Headers to include in the request.
    var headers: [String: String]? { get set }
    
    /// The body payload for the request.
    var body: Codable? { get set }
    
    /// Constructs a URL from the base URL and path.
    func url() -> URL?
}

extension NetworkRoute {
    /// Default headers for the network request.
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    /// Constructs a URL by appending the path to the base URL.
    func url() -> URL? {
        let baseUrl = Server.development.baseURL
        return URL(string: baseUrl + path)
    }
}

class BaseRoute: NetworkRoute {
    // MARK: - Properties

    /// The endpoint path for the network request. Override in subclasses.
    var path: String {
        fatalError("Subclasses must override the `path` property.")
    }

    /// The HTTP method for the network request. Override in subclasses if needed.
    var method: HTTPMethod {
        fatalError("Subclasses must override the `Method` property.")
    }

    /// Headers for the network request.
    var headers: [String: String]?

    /// The body payload for the network request.
    var body: Codable?

    // MARK: - Initializer
    

    init(headers: [String: String]? = nil, body: Codable? = nil) {
        self.headers = headers
        self.body = body
    }

    // MARK: - Methods

    /// Sets the body payload for the network request.
    func setBody(_ body: Codable) {
        self.body = body
    }

    /// Sets the headers for the network request.
    func setHeaders(_ headers: [String: String]) {
        self.headers = headers
    }
}

