//
//  Comment.swift
//  projectpmd
//
//  Created by Mac-Mini-2021 on 12/11/2023.
//

import Foundation
struct Comment: Identifiable {
    var id = UUID()
    var user: User
    var text: String
}

