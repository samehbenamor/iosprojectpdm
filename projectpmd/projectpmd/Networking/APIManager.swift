//
//  APIManager.swift
//  projectpmd
//
//  Created by Mac Mini 2 on 11/11/2023.
//

import Foundation
class APIManager {
    static let shared = APIManager()

    func signup(data: Data, completion: @escaping (Result<Void, Error>) -> Void) {
        // Replace the placeholder URL with your actual signup endpoint
        let url = URL(string: "http://localhost:9090/api/users/signup")!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle the API response
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }.resume()
    }
}
