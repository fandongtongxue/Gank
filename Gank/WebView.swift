//
//  WebView.swift
//  Gank
//
//  Created by Mac on 2021/5/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url = ""
    func makeUIView(context: Context) -> some WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if url.count > 0 {
            let request = URLRequest(url: URL(string: url)!)
            uiView.load(request)
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
