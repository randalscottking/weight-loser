import SwiftUI

struct WeightHistoryView: View {
    @ObservedObject var dataManager = DataManager.shared
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dataManager.weightEntries.sorted(by: { $0.timestamp > $1.timestamp })) { entry in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(String(format: "%.2f %@", entry.weight, entry.unit.rawValue))
                                .font(.headline)
                            Text(entry.timestamp, style: .date)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        if let notes = entry.notes {
                            Text(notes)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Weight History")
            .navigationBarItems(trailing: Button("Clear Old Entries") {
                dataManager.clearOldEntries()
            })
        }
    }
}

struct WeightHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        WeightHistoryView()
    }
}