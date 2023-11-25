//
//  Endpoint.swift
//  eCommerce
//
//  Created by Bekir Berke Yılmaz on 25.11.2023.
//

import Foundation
protocol EndpointProtocol{
    var baseUrl: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var header: [String: String]? {get}
    func request() -> URLRequest
}

enum Endpoint{
    case getProducts
}

enum HTTPMethod: String{
    case get = "GET"
    case post = "POST"
}

extension Endpoint:EndpointProtocol{
    var baseUrl: String {
        return "https://fakestoreapi.com"
    }
    
    var path: String {
        switch self{
        case.getProducts:
            return "/products"
        }
    }
    
    var method: HTTPMethod {
        switch self{
        case.getProducts: return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseUrl) else {
            fatalError("INVALID URL")
        }
        components.path = path
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        if let header = header {
            for (key, value) in header {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }

}
