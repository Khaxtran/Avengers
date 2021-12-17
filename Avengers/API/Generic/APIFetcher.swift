//
//  APIFetcher.swift
//  Avengers
//
//  Created by Kha Tran on 17/12/21.
//

import Foundation

class APIFetcher {
    
    public func request<T: Codable>(
        url: String,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ){
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!) {data, _, error in
            guard let data = data else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

