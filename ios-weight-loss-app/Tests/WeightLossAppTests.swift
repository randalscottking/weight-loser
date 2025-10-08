import XCTest
@testable import ios_weight_loss_app

final class WeightLossAppTests: XCTestCase {
    
    func testWeightEntryCreation() {
        let weightEntry = WeightEntry(weight: 150.5, unit: .pounds)
        
        XCTAssertNotNil(weightEntry.id)
        XCTAssertEqual(weightEntry.weight, 150.5)
        XCTAssertEqual(weightEntry.unit, .pounds)
    }
    
    func testUserCreation() {
        let user = User(name: "John Doe", email: "john@example.com")
        
        XCTAssertNotNil(user.id)
        XCTAssertEqual(user.name, "John Doe")
        XCTAssertEqual(user.email, "john@example.com")
    }
    
    func testGoalCreation() {
        let goal = Goal(userId: "user123", targetWeight: 120.0, startDate: Date(), targetDate: Date(), unit: .kilograms)
        
        XCTAssertNotNil(goal.id)
        XCTAssertEqual(goal.userId, "user123")
        XCTAssertEqual(goal.targetWeight, 120.0)
        XCTAssertEqual(goal.unit, .kilograms)
    }
    
    func testNotificationCreation() {
        let notification = Notification(userId: "user123", title: "Milestone Reached", body: "You reached your goal!")
        
        XCTAssertNotNil(notification.id)
        XCTAssertEqual(notification.userId, "user123")
        XCTAssertEqual(notification.title, "Milestone Reached")
        XCTAssertEqual(notification.body, "You reached your goal!")
        XCTAssertFalse(notification.isRead)
    }
    
    func testDataManagerSaveAndRetrieveWeightEntry() {
        let dataManager = DataManager.shared
        let weightEntry = WeightEntry(weight: 150.0, unit: .pounds)
        
        // Clear any existing data
        dataManager.deleteWeightEntry(withId: weightEntry.id)
        
        // Save the entry
        dataManager.saveWeightEntry(weightEntry)
        
        // Retrieve the entry
        let retrievedEntries = dataManager.getAllWeightEntries()
        
        // Verify it was saved correctly
        XCTAssertEqual(retrievedEntries.count, 1)
        XCTAssertEqual(retrievedEntries[0].id, weightEntry.id)
        XCTAssertEqual(retrievedEntries[0].weight, 150.0)
    }
    
    func testDataManagerSaveAndRetrieveUser() {
        let dataManager = DataManager.shared
        let user = User(name: "Jane Smith", email: "jane@example.com")
        
        // Save the user
        dataManager.saveUser(user)
        
        // Retrieve the user
        let retrievedUser = dataManager.getCurrentUser()
        
        // Verify it was saved correctly
        XCTAssertNotNil(retrievedUser)
        XCTAssertEqual(retrievedUser?.id, user.id)
        XCTAssertEqual(retrievedUser?.name, "Jane Smith")
        XCTAssertEqual(retrievedUser?.email, "jane@example.com")
    }
    
    func testDataManagerSaveAndRetrieveGoal() {
        let dataManager = DataManager.shared
        let goal = Goal(userId: "user456", targetWeight: 130.0, startDate: Date(), targetDate: Date(), unit: .stones)
        
        // Clear any existing data
        dataManager.deleteGoal(withId: goal.id)
        
        // Save the goal
        dataManager.saveGoal(goal)
        
        // Retrieve the goal
        let retrievedGoals = dataManager.getAllGoals()
        
        // Verify it was saved correctly
        XCTAssertEqual(retrievedGoals.count, 1)
        XCTAssertEqual(retrievedGoals[0].id, goal.id)
        XCTAssertEqual(retrievedGoals[0].userId, "user456")
        XCTAssertEqual(retrievedGoals[0].targetWeight, 130.0)
    }
    
    func testDataManagerSaveAndRetrieveNotification() {
        let dataManager = DataManager.shared
        let notification = Notification(userId: "user789", title: "Reminder", body: "Don't forget to log your weight")
        
        // Clear any existing data
        // Note: We can't easily delete notifications without knowing the ID, so we'll just test saving
        
        // Save the notification
        dataManager.saveNotification(notification)
        
        // Retrieve the notifications
        let retrievedNotifications = dataManager.getAllNotifications()
        
        // Verify it was saved correctly
        XCTAssertEqual(retrievedNotifications.count, 1)
        XCTAssertEqual(retrievedNotifications[0].id, notification.id)
        XCTAssertEqual(retrievedNotifications[0].userId, "user789")
        XCTAssertEqual(retrievedNotifications[0].title, "Reminder")
    }
}
