import SwiftUI

@main
struct StrokeTherapyGuideApp: App {
    @StateObject private var recordsStore = RecordsStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recordsStore)
        }
    }
}
