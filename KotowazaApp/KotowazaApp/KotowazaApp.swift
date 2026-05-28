import SwiftUI

@main
struct KotowazaApp: App {

    @StateObject private var viewModel = ProverbViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
