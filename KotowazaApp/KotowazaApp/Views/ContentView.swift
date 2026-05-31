import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("今日", systemImage: "sun.max.fill")
                }

            ProverbListView()
                .tabItem {
                    Label("一覧", systemImage: "list.bullet")
                }

            QuizView()
                .tabItem {
                    Label("クイズ", systemImage: "questionmark.circle.fill")
                }

            SettingsView()
                .tabItem {
                    Label("設定", systemImage: "gearshape.fill")
                }
        }
        .tint(.orange)
    }
}
