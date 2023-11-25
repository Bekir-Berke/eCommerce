//
//  NetworkManager.swift
//  eCommerce
//
//  Created by Bekir Berke Yılmaz on 25.11.2023.
//

import Foundation
class NetworkManager{
    static let shared = NetworkManager()
    private init(){}
    
    private func request<T:Codable>(_ endpoint: Endpoint, completion: @escaping(Result<T, Error>) -> Void){
        let task = URLSession.shared.dataTask(with: endpoint.request()){data, response, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 299 else{
                completion(.failure(NSError(domain: "Invalid Response", code: 0)))
                return
            }
            guard let data = data else{
                completion(.failure(NSError(domain: "Invalid Data", code: 0)))
                return
            }
            do{
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    func getProducts(completion: @escaping(Result<[Product],Error>)->Void){
        let endpoint = Endpoint.getProducts
        request(endpoint, completion: completion)
    }
}
