import Foundation

struct Goal: Codable, Identifiable {
    let id: String
    let userId: String
    let targetWeight: Double
    let startDate: Date
    let targetDate: Date
    let unit: WeightUnit
    let createdAt: Date
    
    init(id: String = UUID().uuidString, userId: String, targetWeight: Double, startDate: Date, targetDate: Date, unit: WeightUnit) {
        self.id = id
        self.userId = userId
        self.targetWeight = targetWeight
        self.startDate = startDate
        self.targetDate = targetDate
        self.unit = unit
        self.createdAt = Date()
    }
}
