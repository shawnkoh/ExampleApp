//
//  ExampleAppApp.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import SwiftUI
import Resolver

class AppViewModel: ObservableObject {
    @Injected var firebaseService: FirebaseService

    init() {
        firebaseService.configure()
    }
}

@main
struct ExampleAppApp: App {
    @StateObject var viewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
