//
//  Lesson.swift
//  projectpmd
//
//  Created by Mac-Mini-2021 on 14/11/2023.
//

import Foundation

struct Lesson: Identifiable, Codable {
    var id: String
    var name: String
    var description: String
    var video: String
}
