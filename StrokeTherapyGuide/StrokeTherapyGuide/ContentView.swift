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
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
}
