//
//  ContentView.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import SwiftUI
import Resolver

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Resolver.root = .mock
        return ContentView()
    }
}
