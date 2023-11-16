<<<<<<< Updated upstream
//
//  Event.swift
//  projectpmd
//
//  Created by Mac-Mini-2021 on 15/11/2023.
//

import Foundation
struct Event {
    var name: String
    var date: Date
    var location: String
    var description: String
    var whatsappLink: String
    var selectedImage: String
=======
import Foundation

struct Event: Codable, Identifiable {
    var id: String?
    var eventName: String
    var eventDate: Date
    var textwhats: String
    var eventLocation: String
    var eventDescription: String
  
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case eventName
        case eventDate
        case textwhats
        case eventLocation
        case eventDescription
    }
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
    }
>>>>>>> Stashed changes
}
