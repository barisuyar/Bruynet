//
//  Endpoint.swift
//  
//
//  Created by Barış Uyar on 1.12.2020.
//

import Foundation

public struct Endpoint {
    
    public enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case delete = "DELETE"
        case put = "PUT"
    }
    var path: String
    var body: Data?
    var httpMethod: HTTPMethod = .get
    
    public init(path: String, httpMethod: HTTPMethod = .get) {
        self.path = path
        self.httpMethod = httpMethod
    }
    
    public init<C>(path: String, body: C? = nil, httpMethod: HTTPMethod = .post) where C: Encodable {
        self.init(path: path, httpMethod: httpMethod)
        do {
            self.body = try JSONEncoder().encode(body)
        } catch {
            self.body = nil
        }
    }
}

extension Endpoint {
    var url: URL {
        guard let baseURL = URLSession.shared.baseURL, !baseURL.isEmpty, var url = URL(string: baseURL) else { preconditionFailure("") }
        url.appendPathComponent(path)
        return url
    }
}
