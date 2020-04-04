//
//  NetworkService.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation
import Combine

final class NetworkService {
    
    func baseRequest<T>(request: BaseAPIRequest<T>) -> AnyPublisher<T, Error> {
        guard let urlRequest = urlRequestWith(request: request) else { fatalError("Invalid URL") }
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            
            .eraseToAnyPublisher()
        
    }
}

extension NetworkService {
    func urlRequestWith<T>(request: BaseAPIRequest<T>) -> URLRequest? {
        let completeURL: String =
                request.baseURL +
                request.apiVersion +
                request.apiPath +
                request.endPoint.description
        
        var urlComponents: URLComponents = URLComponents(string: completeURL)!
        urlComponents.queryItems = request.queryItems
        
        var urlRequest: URLRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = request.httpMethod.description
        urlRequest.setValue(request.contentType, forHTTPHeaderField: "Content-Type")
        print(urlRequest)
        
        return urlRequest
    }
}
