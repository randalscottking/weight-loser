import SwiftUI

struct MainContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            WeightEntryView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Add Entry")
                }
                .tag(0)
            
            WeightHistoryView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("History")
                }
                .tag(1)
            
            ChartView()
                .tabItem {
                    Image(systemName: "chart.line.up")
                    Text("Charts")
                }
                .tag(2)
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}