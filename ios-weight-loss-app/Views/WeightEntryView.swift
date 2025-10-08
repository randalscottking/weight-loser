import SwiftUI

struct WeightEntryView: View {
    @State private var weightValue = ""
    @State private var selectedUnit = WeightEntry.WeightUnit.kg
    @State private var notes = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Weight Measurement")) {
                    TextField("Weight", text: $weightValue)
                        .keyboardType(.decimalPad)
                    
                    Picker("Unit", selection: $selectedUnit) {
                        ForEach(WeightEntry.WeightUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue.uppercased()).tag(unit)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Additional Information")) {
                    TextField("Notes (optional)", text: $notes)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Section {
                    Button("Save Entry") {
                        saveWeightEntry()
                    }
                    .disabled(weightValue.isEmpty)
                }
            }
            .navigationTitle("Add Weight Entry")
            .alert("Save Result", isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    private func saveWeightEntry() {
        guard let weight = Double(weightValue) else {
            alertMessage = "Please enter a valid weight value"
            showingAlert = true
            return
        }
        
        let entry = WeightEntry(
            weight: weight,
            unit: selectedUnit,
            timestamp: Date(),
            notes: notes.isEmpty ? nil : notes
        )
        
        DataManager.shared.addWeightEntry(entry)
        alertMessage = "Weight entry saved successfully"
        showingAlert = true
        
        // Reset form
        weightValue = ""
        notes = ""
    }
}

struct WeightEntryView_Previews: PreviewProvider {
    static var previews: some View {
        WeightEntryView()
    }
}