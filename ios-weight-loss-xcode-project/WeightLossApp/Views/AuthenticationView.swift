import SwiftUI

struct AuthenticationView: View {
    @State private var pin = ""
    @State private var errorMessage = ""
    @State private var isPinSet = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Weight Loss Tracker")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            if isPinSet {
                Text("Enter 4-digit PIN")
                    .font(.title2)
            } else {
                Text("Set 4-digit PIN")
                    .font(.title2)
            }
            
            SecureField("PIN", text: $pin)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 200)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button(action: handlePINSubmission) {
                Text(isPinSet ? "Unlock" : "Set PIN")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(pin.count != 4)
        }
        .padding()
        .onAppear {
            isPinSet = PINManager.shared.isPINSet()
        }
    }
    
    private func handlePINSubmission() {
        if isPinSet {
            // Validate existing PIN
            if PINManager.shared.validatePIN(pin) {
                // Navigate to main app
                print("PIN validated successfully")
            } else {
                errorMessage = "Invalid PIN"
                pin = ""
            }
        } else {
            // Set new PIN
            if PINManager.shared.setPIN(pin) {
                // PIN set successfully
                print("PIN set successfully")
                isPinSet = true
                pin = ""
            } else {
                errorMessage = "PIN must be 4 digits"
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}