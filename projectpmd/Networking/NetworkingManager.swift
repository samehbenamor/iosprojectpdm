import Foundation

class NetworkingManager {
    static let shared = NetworkingManager()

<<<<<<< Updated upstream
<<<<<<< Updated upstream
    private let baseURL = "http://localhost:5000/comments"
=======
    private let baseURL = "http://localhost:5001/comments"
>>>>>>> Stashed changes
=======
    var likedLessons: [Lesson] = []
    private let baseURL = "http://localhost:5001/comments"
>>>>>>> Stashed changes

    // MARK: - POST Request to Add Comment

    func postComment(_ commentData: [String: Any], completion: @escaping (Result<Comment, Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
            completion(.failure(error))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: commentData, options: [])
        } catch {
            completion(.failure(error))
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                let error = NSError(domain: "HTTP Error", code: statusCode, userInfo: nil)
                completion(.failure(error))
                return
            }

            do {
                let comment = try JSONDecoder().decode(Comment.self, from: data!)
                completion(.success(comment))
            } catch {
                completion(.failure(error))
            }

            // Debug information
            print("Request URL: \(url)")
            print("Request Body: \(String(data: request.httpBody ?? Data(), encoding: .utf8) ?? "")")
            print("Response Status Code: \(httpResponse.statusCode)")
            print("Response Data: \(String(data: data ?? Data(), encoding: .utf8) ?? "")")

        }.resume()
    }


       func getCommentsByLessonId(_ lessonId: String, completion: @escaping (Result<[Comment], Error>) -> Void) {
           guard let url = URL(string: "\(baseURL)/\(lessonId)") else {
               let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
               completion(.failure(error))
               return
           }

           URLSession.shared.dataTask(with: url) { data, response, error in
               if let error = error {
                   completion(.failure(error))
                   return
               }

               guard let data = data else {
                   let error = NSError(domain: "No data received", code: 0, userInfo: nil)
                   completion(.failure(error))
                   return
               }

               do {
                   let comments = try JSONDecoder().decode([Comment].self, from: data)
                   completion(.success(comments))
               } catch {
                   completion(.failure(error))
               }
           }.resume()
       }
<<<<<<< Updated upstream
   }
=======
    
    func likeLesson(lessonId: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:5001/likes/likeLesson") else {
            print("Invalid URL for liking a lesson")
            completion(.failure(NSError(domain: "InvalidURL", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL for liking a lesson"])))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let likeData: [String: Any] = [
            "lessonId": lessonId
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: likeData)
            request.httpBody = jsonData

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(NSError(domain: "HTTPError", code: (response as? HTTPURLResponse)?.statusCode ?? 500, userInfo: nil)))
                    return
                }

                // Assuming a successful response
                completion(.success(()))
            }.resume()
        } catch {
            completion(.failure(error))
        }
    }

    func fetchAllLikedLessons(completion: @escaping (Result<[Lesson], Error>) -> Void) {
        guard let url = URL(string: "http://localhost:5001/likes/allLikedLessons") else {
            let error = NSError(domain: "InvalidURL", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL for fetching all liked lessons"])
            completion(.failure(error))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                let error = NSError(domain: "HTTP Error", code: statusCode, userInfo: nil)
                completion(.failure(error))
                return
            }

            guard let data = data else {
                let error = NSError(domain: "No data received", code: 0, userInfo: nil)
                completion(.failure(error))
                return
            }

            do {
                let lessons = try JSONDecoder().decode([Lesson].self, from: data)
                completion(.success(lessons))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }



}
>>>>>>> Stashed changes
