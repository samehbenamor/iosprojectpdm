//
//  UserProfile.swift
//  projectpmd
//
//  Created by Apple Esprit on 15/11/2023.
//
import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var isLoading = false
    @Published var error: Error?
    
    private let apiManager = APIManager.shared
    
    func authenticateUserProfile() {
        //isLoading = true
        guard let token = UserDefaults.standard.string(forKey: "accessToken") else {
            return print("error getting the token")
        }
        print("test")
        print(token)
        
        let apiUrl = URL(string: "http://172.20.10.3:9090/api/users/authenticate-profile")!
        do {
            
            
            var request = URLRequest(url: apiUrl)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue(token, forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let data = data {
                    
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        /*guard let userInfo = jsonResponse else {
                            // Handle the case where jsonResponse is nil
                            print("Failed to parse JSON response")
                            return
                        }*/
                        //print(jsonResponse)
                        
                        guard let userInfo = jsonResponse else { return }

                        let id = userInfo["id"] as? String
                        if let id = id {
                            print("ID: \(id)")
                            UserDefaults.standard.set(id, forKey: "userId")
                        } else {
                            print("Failed to retrieve ID from JSON response")
                        }

                        let fullname = userInfo["fullname"] as? String
                        if let fullname = fullname {
                            print("Fullname: \(fullname)")
                            UserDefaults.standard.set(fullname, forKey: "userFullName")
                        } else {
                            print("Failed to retrieve fullname from JSON response")
                        }

                        let email = userInfo["email"] as? String
                        if let email = email {
                            print("Email: \(email)")
                            UserDefaults.standard.set(email, forKey: "userEmail")
                        } else {
                            print("Failed to retrieve email from JSON response")
                        }

                        let dateofbirthString = userInfo["dateofbirth"] as? String
                        if let dateofbirthString = dateofbirthString {
                           
                            
                                print("Date of birth: \(dateofbirthString)")
                            UserDefaults.standard.set(dateofbirthString, forKey: "userDateOfBirth")
                           
                             
                            
                        } else {
                            print("Failed to retrieve date of birth from JSON response")
                        }

                        let roleString = userInfo["role"] as? String
                        if let roleString = roleString {
                            
                            print("Role: \(roleString)")
                            UserDefaults.standard.set(roleString, forKey: "userRole")
                        } else {
                            print("Failed to retrieve role from JSON response")
                        }

                        let isVerified = userInfo["isVerified"] as? Bool
                        if let isVerified = isVerified {
                            UserDefaults.standard.set(isVerified, forKey: "isUserVerified")
                            print("Is verified: \(isVerified)")
                        } else {
                            print("Failed to retrieve isVerified flag from JSON response")
                        }

                        let isActive = userInfo["isActive"] as? Bool
                        if let isActive = isActive {
                            print("Is active: \(isActive)")
                            UserDefaults.standard.set(isActive, forKey: "isUserActive")
                        } else {
                            print("Failed to retrieve isActive flag from JSON response")
                        }

                        let isBanned = userInfo["isBanned"] as? Bool
                        if let isBanned = isBanned {
                            print("Is banned: \(isBanned)")
                            UserDefaults.standard.set(isBanned, forKey: "isUserBanned")
                        } else {
                            print("Failed to retrieve isBanned flag from JSON response")
                        }
                       
                       
                    } catch {
                        print("Error parsing JSON: \(error.localizedDescription)")
                    }
                    
                }
            }.resume()
            
        } catch {
            print("error taa do")
        }
        
        
        
        
        
    }
}