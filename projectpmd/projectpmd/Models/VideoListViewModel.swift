//
//  VideoListViewModel.swift
//  projectpmd
//
//  Created by Mac-Mini-2021 on 14/11/2023.
//

import Foundation
class VideoListViewModel: ObservableObject {
    @Published var lessons: [Lesson] = []

    func fetchLessons() {
        // Use URLSession to make a request to your Node.js backend
        guard let url = URL(string: "http://localhost:5000/") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error fetching lessons: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            if let decodedLessons = try? JSONDecoder().decode([Lesson].self, from: data) {
                DispatchQueue.main.async {
                    self.lessons = decodedLessons
                }
            }
        }.resume()
    }
}
