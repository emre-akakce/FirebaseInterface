//
//  ContentView.swift
//  FirebaseInterface
//
//  Created by Emre Kardaşlar on 24.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
           // Set the URL to your localhost (e.g., http://localhost:3000 if you're using a local web server)
           WebView(url: URL(string: "http://localhost:3000/cep-telefonu.html")!)
               .edgesIgnoringSafeArea(.all) // Make WebView full screen
       }}

#Preview {
    ContentView()
}
