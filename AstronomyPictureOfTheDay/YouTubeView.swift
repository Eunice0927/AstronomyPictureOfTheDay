//
//  YouTubeVIew.swift
//  AstronomyPictureOfTheDay
//
//  Created by Eunsu JEONG on 12/4/23.
//

import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    let videoId: String
    
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return }

        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}
