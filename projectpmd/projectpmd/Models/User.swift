import Foundation

struct User: Identifiable {
    var id: String?
    var fullname: String
    var email: String
    var password: String
    var dateofbirth: Date
    var role: UserRole
    var profilepicture: String?
    var profilebio: String?
    var location: String?
    var facebooklink: String?
    var instagramlink: String?
    var linkedinlink: String?
    var phonenumber: Int?
    var isActive: Bool
    var isBanned: Bool
    var isVerified: Bool
}

enum UserRole: String {
    case contributor = "Contributeur"
    case organizer = "Organisateur"
    case admin = "Admin"
}
