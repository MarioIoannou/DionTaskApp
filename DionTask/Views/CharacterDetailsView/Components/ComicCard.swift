//
//  CharacterCard.swift
//  task2
//
//  Created by Marios Ioannou on 13/3/25.
//

import SwiftUI

struct CharacterComicCard: View {
    @State private var showWebView = false
    let comic: Comic

    private var secureImageUrl: URL? {
        return comic.imageUrl
    }

    var body: some View {
        ZStack {
            AsyncImage(url: secureImageUrl) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                Color.gray
            }
        }
        .frame(width: 150, height: 180)
        .clipped()
        .cornerRadius(10)
        .padding(8)
        .onTapGesture {
            showWebView = true
        }
        .sheet(isPresented: $showWebView) {
            if let detailUrl = comic.urls.first?.url {
                WebView(url: URL(string: detailUrl))
                    .edgesIgnoringSafeArea(.bottom)
            } else {
                Text("URL not available.")
            }
        }
    }
}
