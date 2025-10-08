import Foundation

struct WeightEntry: Codable, Identifiable {
    let id = UUID()
    let weight: Double
    let unit: WeightUnit
    let timestamp: Date
    let notes: String?
    
    enum WeightUnit: String, Codable {
        case kg = "kg"
        case lbs = "lbs"
        case st = "st"
    }
}