import SwiftUI
import WebKit

// Define a delegate to handle WebView events
class WebViewCoordinator: NSObject, WKScriptMessageHandler {
    var parent: WebView

    init(parent: WebView) {
        self.parent = parent
    }

    // This method gets called when JavaScript sends a message
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "nativeEvent", let messageBody = message.body as? String {
            print("Received event from JavaScript: \(messageBody)")
            // Handle the event (e.g., trigger native action based on message)
        }
    }
}

// WebView SwiftUI wrapper
struct WebView: UIViewRepresentable {
    let url: URL

    func makeCoordinator() -> WebViewCoordinator {
        return WebViewCoordinator(parent: self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        // Configure the WebView's content controller to handle JavaScript messages
        let contentController = webView.configuration.userContentController
        contentController.add(context.coordinator, name: "nativeEvent")
        
        // Load the page
        let request = URLRequest(url: url)
        webView.load(request)
        
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {}
}
