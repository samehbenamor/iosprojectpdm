//
//  testdata.swift
//  projectpmd
//
//  Created by Mac-Mini-2021 on 14/11/2023.
//

import Foundation


struct TestData {
    static let lessons: [Lesson] = [
        Lesson(id: "1", name: "Test Lesson 1", description: "This is a test lesson.", video: "test_video_1"),
        Lesson(id: "2", name: "Test Lesson 2", description: "Another test lesson.", video: "test_video_2"),
        Lesson(id: "3", name: "Test Lesson 3", description: "Yet another test lesson.", video: "test_video_3")
        // Add more lessons as needed
    ]
}
