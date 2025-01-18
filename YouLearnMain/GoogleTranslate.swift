import SwiftUI
import WebKit

struct GoogleTranslate: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // WebView displaying Google Translate
            WebView(url: URL(string: "https://translate.google.com")!)
                .edgesIgnoringSafeArea(.all)
            
            // Go Back Button
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Go Back")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

struct GoogleTranslate_Previews: PreviewProvider {
    static var previews: some View {
        GoogleTranslate()
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        // You can update the view here if needed
    }
}

