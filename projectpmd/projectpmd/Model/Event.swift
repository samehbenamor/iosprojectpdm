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
}
