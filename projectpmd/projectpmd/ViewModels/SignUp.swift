//
//  SignUp.swift
//  projectpmd
//
//  Created by Mac Mini 2 on 11/11/2023.
//

import Foundation
class SignUp: ObservableObject {
    // Bindable properties for user input
    @Published var fullname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var role: String = "" // Add role property
    @Published var dateofbirth: Date = Date() // Use dateofbirth property
    @Published var passwordVerify: String = ""
    @Published var signupError: String = ""
    // Function to send signup request
    func signup() {
        // Create a JSON body
        let requestBody: [String: Any] = [
            "fullname": fullname,
            "email": email,
            "password": password,
            "role": role, // Include role in the JSON body
            "dateofbirth": dateofbirth, // Use dateofbirth in the JSON body
            // ... include other properties
        ]

        // Convert the request body to Data
        if let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) {
            // Perform the API request (you'll need to implement this)
            APIManager.shared.signup(data: jsonData) { result in
                // Handle the result (success or failure)
                switch result {
                case .success:
                    // Handle successful signup
                    self.signupError = "Signup Success"
                    print("Signup successful")
                case .failure(let error):
                    // Handle signup failure
                    self.signupError = "Signup failed: \(error.localizedDescription)"
                    print("Signup failed: \(error.localizedDescription)")
                }
            }
        }
    }
}
