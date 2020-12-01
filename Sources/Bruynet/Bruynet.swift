import Foundation
import Combine

public protocol Calling {
    func call<T: Decodable>(type: T.Type, endpoint: Endpoint) -> AnyPublisher<T, Error>
}

public struct Bruynet: Calling {
    let session = URLSession.shared
    
    public init() {}
    
    public func call<T>(type: T.Type, endpoint: Endpoint) -> AnyPublisher<T, Error> where T: Decodable {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.httpMethod.rawValue
        if let body = endpoint.body {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = body
        }
        return session.dataTaskPublisher(for: request)
            .tryMap { 
                try JSONDecoder().decode(T.self, from: $0.data) 
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


