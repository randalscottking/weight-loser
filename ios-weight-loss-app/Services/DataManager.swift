import Foundation
import Combine

class DataManager: ObservableObject {
    static let shared = DataManager()
    
    private init() {
        // Initialize with sample data or load from persistent storage
        loadWeightEntries()
    }
    
    @Published var weightEntries: [WeightEntry] = []
    
    func addWeightEntry(_ entry: WeightEntry) {
        weightEntries.append(entry)
        saveWeightEntries()
    }
    
    func deleteWeightEntry(_ entry: WeightEntry) {
        weightEntries.removeAll { $0.id == entry.id }
        saveWeightEntries()
    }
    
    func clearOldEntries() {
        let sixMonthsAgo = Calendar.current.date(byAdding: .month, value: -6, to: Date())!
        weightEntries.removeAll { $0.timestamp < sixMonthsAgo }
        saveWeightEntries()
    }
    
    private func saveWeightEntries() {
        // In a real app, this would save to UserDefaults or Core Data
        // For now, we'll just print a message
        print("Saving \(weightEntries.count) weight entries")
    }
    
    private func loadWeightEntries() {
        // In a real app, this would load from UserDefaults or Core Data
        // For now, we'll just print a message
        print("Loading weight entries")
    }
}