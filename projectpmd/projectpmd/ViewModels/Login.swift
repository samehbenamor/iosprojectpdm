//
//  Login.swift
//  projectpmd
//
//  Created by Mac Mini 2 on 11/11/2023.
//

import Foundation
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    private let apiManager = APIManager.shared

    func login() {
        // Create a JSON body with the user's credentials
        let requestBody: [String: Any] = [
            "email": email,
            "password": password,
        ]
        
        // Convert the JSON body to Data
        if let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) {
            
            // Perform the API request
            apiManager.login(data: jsonData) { result in
                // Handle the result (success or failure)
                switch result {
                case .success(let token):
                    
                    // The login was successful. Store the JWT token and navigate to the main app screen.
                    print("Login successful! JWT token: \(token)")
                    print(self.email)
                    print(self.password)
                case .failure(let error):
                    // The login failed. Display an error message to the user.
                    print("Login failed: \(error)")
                }
            }
            
        }
    }
}
