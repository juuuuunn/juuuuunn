import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("ホーム", systemImage: "house.fill")
                }

            ProtocolListView()
                .tabItem {
                    Label("治療プロトコル", systemImage: "list.clipboard.fill")
                }

            ExerciseListView()
                .tabItem {
                    Label("運動メニュー", systemImage: "figure.strengthtraining.traditional")
                }

            AssessmentListView()
                .tabItem {
                    Label("評価ツール", systemImage: "checkmark.seal.fill")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
}
