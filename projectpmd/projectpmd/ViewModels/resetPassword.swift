//
//  resetPassword.swift
//  projectpmd
//
//  Created by Apple Esprit on 19/11/2023.
//

import Foundation
class resetPasswordViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var isVerificationSent: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var newPassword: String = ""
    @Published var verifyPassword: String = ""
    @Published var isNavigationActive: Bool = false
    private let apiManager = APIManager.shared
    func resetPassword() {
            DispatchQueue.main.async {
                self.isLoading = true // Show loading view
            }

            guard let userId = UserDefaults.standard.string(forKey: "userId") else {
                errorMessage = "User ID not found in UserDefaults"
                return
            }
        if newPassword != verifyPassword {
            self.errorMessage = "New password and verify password do not match"
                    return
                }
            let apiUrl = URL(string: "http://172.20.10.3:9090/api/users/resetpassword/\(userId)/\(newPassword)")!

            do {
                
                var request = URLRequest(url: apiUrl)

                // Set the request method to POST
                request.httpMethod = "POST"

                // Set the request body with the JSON data
                

                // Set the request header to indicate JSON content
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")

                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    // Handle the response and error here
                    if let error = error {
                        self.errorMessage = "Could not verify password"
                    } else if let data = data {
                        // Parse and handle the response data
                        // Note: You should handle this according to your API response format
                        do {
                            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                            //print("Response: \(jsonResponse)")
                            print(jsonResponse)
                            if let jsonDictionary = jsonResponse as? [String: Any], let message = jsonDictionary["message"] as? String {
                                print("Message: \(message)")
                            }
                            // You can update your UI or perform other actions based on the response
                        } catch {
                            print("Error parsing JSON: \(error.localizedDescription)")
                        }
                    }
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.isNavigationActive = true
                    }
                }.resume()

            } catch {
                print("error taa do")
            }
        }
}
