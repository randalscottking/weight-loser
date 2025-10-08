import Foundation

struct WeightEntry: Codable, Identifiable {
    let id: String
    let weight: Double
    let unit: WeightUnit
    let timestamp: Date
    
    init(id: String = UUID().uuidString, weight: Double, unit: WeightUnit, timestamp: Date = Date()) {
        self.id = id
        self.weight = weight
        self.unit = unit
        self.timestamp = timestamp
    }
}

enum WeightUnit: String, Codable {
    case pounds = "lbs"
    case kilograms = "kg"
    case stones = "st"
}
