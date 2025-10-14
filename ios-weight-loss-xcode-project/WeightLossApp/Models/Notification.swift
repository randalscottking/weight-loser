import Foundation

struct Notification: Codable, Identifiable {
    let id: String
    let userId: String
    let title: String
    let body: String
    let isRead: Bool
    let createdAt: Date
    
    init(id: String = UUID().uuidString, userId: String, title: String, body: String) {
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
        self.isRead = false
        self.createdAt = Date()
    }
}
