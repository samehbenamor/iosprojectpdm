import Foundation

struct Lesson: Codable, Identifiable {
    var id: String?
    var name: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case description
    }
    
    static func == (lhs: Lesson, rhs: Lesson) -> Bool {
        return lhs.id == rhs.id
    }
}
struct ErrorResponse: Decodable {
    let message: String
}
