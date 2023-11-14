//
//  LessonViewModel.swift
//  projectpmd
//
//  Created by Mac-Mini-2021 on 14/11/2023.
//

import Foundation
import SwiftUI

class LessonViewModel: ObservableObject {
    @Published var lessons: [Lesson] = []

    func fetchLessons() {
        guard let url = URL(string: "http://localhost:5000/lessons") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error fetching lessons: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let decodedLessons = try JSONDecoder().decode([Lesson].self, from: data)
                DispatchQueue.main.async {
                    self.lessons = decodedLessons
                }
            } catch {
                print("Error decoding lessons: \(error.localizedDescription)")
            }
        }.resume()
    }

    func addLesson(name: String, description: String, video: String) {
        guard let url = URL(string: "http://localhost:5000/lessons") else { return }
        
        let newLesson = Lesson(id: UUID().uuidString, name: name, description: description, video: video)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(newLesson)
            request.httpBody = jsonData

            URLSession.shared.dataTask(with: request) { _, _, error in
                if let error = error {
                    print("Error adding lesson: \(error.localizedDescription)")
                } else {
                    // Refresh lessons after adding
                    self.fetchLessons()
                }
            }.resume()
        } catch {
            print("Error encoding lesson: \(error.localizedDescription)")
        }
    }

    func updateLesson(lesson: Lesson) {
        guard let url = URL(string: "http://localhost:5000/lessons/\(lesson.id)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(lesson)
            request.httpBody = jsonData

            URLSession.shared.dataTask(with: request) { _, _, error in
                if let error = error {
                    print("Error updating lesson: \(error.localizedDescription)")
                } else {
                    // Refresh lessons after updating
                    self.fetchLessons()
                }
            }.resume()
        } catch {
            print("Error encoding lesson: \(error.localizedDescription)")
        }
    }

    func deleteLesson(lesson: Lesson) {
        guard let url = URL(string: "http://localhost:5000/lessons/\(lesson.id)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        URLSession.shared.dataTask(with: request) { _, _, error in
            if let error = error {
                print("Error deleting lesson: \(error.localizedDescription)")
            } else {
                // Refresh lessons after deleting
                self.fetchLessons()
            }
        }.resume()
    }
}
