import Foundation
import Security

class PINManager {
    static let shared = PINManager()
    
    private init() {}
    
    func setPIN(_ pin: String) -> Bool {
        guard pin.count == 4, pin.rangeOfCharacter(from: .decimalDigits) != nil else {
            return false
        }
        
        // Store PIN securely using Keychain
        return savePINToKeychain(pin)
    }
    
    func validatePIN(_ pin: String) -> Bool {
        guard let storedPIN = retrievePINFromKeychain() else {
            return false
        }
        return pin == storedPIN
    }
    
    func isPINSet() -> Bool {
        return retrievePINFromKeychain() != nil
    }
    
    func deletePIN() {
        // Remove PIN from Keychain
        deletePINFromKeychain()
    }
    
    private func savePINToKeychain(_ pin: String) -> Bool {
        // In a real implementation, this would use the Keychain Services API
        // For demonstration purposes, we'll just return true
        print("Storing PIN securely in Keychain")
        return true
    }
    
    private func retrievePINFromKeychain() -> String? {
        // In a real implementation, this would retrieve from Keychain Services
        // For demonstration purposes, we'll return nil
        print("Retrieving PIN from Keychain")
        return nil
    }
    
    private func deletePINFromKeychain() {
        // In a real implementation, this would delete from Keychain Services
        print("Deleting PIN from Keychain")
    }
}