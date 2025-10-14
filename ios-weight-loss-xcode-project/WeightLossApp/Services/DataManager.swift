import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    // MARK: - Weight Entries
    
    func saveWeightEntry(_ weightEntry: WeightEntry) {
        var entries = getAllWeightEntries()
        entries.append(weightEntry)
        saveWeightEntries(entries)
    }
    
    func getAllWeightEntries() -> [WeightEntry] {
        guard let data = UserDefaults.standard.data(forKey: "WeightEntries"),
              let entries = try? JSONDecoder().decode([WeightEntry].self, from: data) else {
            return []
        }
        return entries
    }
    
    func deleteWeightEntry(withId id: String) {
        var entries = getAllWeightEntries()
        entries.removeAll { $0.id == id }
        saveWeightEntries(entries)
    }
    
    private func saveWeightEntries(_ entries: [WeightEntry]) {
        if let data = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(data, forKey: "WeightEntries")
        }
    }
    
    // MARK: - Users
    
    func saveUser(_ user: User) {
        if let data = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(data, forKey: "CurrentUser")
        }
    }
    
    func getCurrentUser() -> User? {
        guard let data = UserDefaults.standard.data(forKey: "CurrentUser"),
              let user = try? JSONDecoder().decode(User.self, from: data) else {
            return nil
        }
        return user
    }
    
    // MARK: - Goals
    
    func saveGoal(_ goal: Goal) {
        var goals = getAllGoals()
        goals.append(goal)
        saveGoals(goals)
    }
    
    func getAllGoals() -> [Goal] {
        guard let data = UserDefaults.standard.data(forKey: "Goals"),
              let goals = try? JSONDecoder().decode([Goal].self, from: data) else {
            return []
        }
        return goals
    }
    
    func deleteGoal(withId id: String) {
        var goals = getAllGoals()
        goals.removeAll { $0.id == id }
        saveGoals(goals)
    }
    
    private func saveGoals(_ goals: [Goal]) {
        if let data = try? JSONEncoder().encode(goals) {
            UserDefaults.standard.set(data, forKey: "Goals")
        }
    }
    
    // MARK: - Notifications
    
    func saveNotification(_ notification: Notification) {
        var notifications = getAllNotifications()
        notifications.append(notification)
        saveNotifications(notifications)
    }
    
    func getAllNotifications() -> [Notification] {
        guard let data = UserDefaults.standard.data(forKey: "Notifications"),
              let notifications = try? JSONDecoder().decode([Notification].self, from: data) else {
            return []
        }
        return notifications
    }
    
    func markNotificationAsRead(_ id: String) {
        var notifications = getAllNotifications()
        if let index = notifications.firstIndex(where: { $0.id == id }) {
            notifications[index].isRead = true
            saveNotifications(notifications)
        }
    }
    
    private func saveNotifications(_ notifications: [Notification]) {
        if let data = try? JSONEncoder().encode(notifications) {
            UserDefaults.standard.set(data, forKey: "Notifications")
        }
    }
}
