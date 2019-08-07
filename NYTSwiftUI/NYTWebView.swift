//
//  NYTWebView.swift
//  NYTSwiftUI
//
//  Created by Aftab Ahmed on 7/5/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import SwiftUI
import WebKit

struct NYTWebView : UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}

#if DEBUG
struct NYTimesWebView_Previews : PreviewProvider {
    static var previews: some View {
        NYTWebView(request: URLRequest(url: URL(string: "https://www.apple.com")!))
    }
}
#endif
