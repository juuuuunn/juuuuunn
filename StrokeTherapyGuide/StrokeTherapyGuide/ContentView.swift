import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("ホーム", systemImage: "house.fill")
                }

            AssessmentListView()
                .tabItem {
                    Label("評価ツール", systemImage: "checklist")
                }

            RecordsSummaryView()
                .tabItem {
                    Label("評価記録", systemImage: "chart.bar.doc.horizontal")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
        .environmentObject(RecordsStore())
}
