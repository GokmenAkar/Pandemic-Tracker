//
//  BaseAPIRequest.swift
//  Pandemic Tracker
//
//  Created by Developer on 3.04.2020.
//  Copyright © 2020 Akar. All rights reserved.
//

import Foundation

class BaseAPIRequest<T: Codable> {
    private(set) var baseURL: String = "https://corona.lmao.ninja/"
    
    var apiPath: String { "" }
    var apiVersion: String { "" } 
    var endPoint: EndPoints! { nil }
    
    var contentType: String { "application/json" }
    var httpMethod: HTTPMethod { .get }
    
    var queryItems: [URLQueryItem]? { nil }
    
}
