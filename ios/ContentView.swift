import SwiftUI
import WebKit

struct ShogiWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.preferences.javaScriptEnabled = true
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.scrollView.isScrollEnabled = true
        webView.scrollView.bounces = false
        webView.backgroundColor = UIColor(red: 0.18, green: 0.12, blue: 0.05, alpha: 1)
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let htmlURL = Bundle.main.url(forResource: "index", withExtension: "html") else {
            return
        }
        let baseURL = htmlURL.deletingLastPathComponent()
        webView.loadFileURL(htmlURL, allowingReadAccessTo: baseURL)
    }
}

struct ContentView: View {
    var body: some View {
        ShogiWebView()
            .ignoresSafeArea()
    }
}
