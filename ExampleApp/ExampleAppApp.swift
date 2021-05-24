//
//  ExampleAppApp.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import SwiftUI
import Resolver

final class AppViewModel: ObservableObject {
    @LazyInjected private var firebaseService: FirebaseService

    init() {
        firebaseService.configure()
    }
}

@main
struct ExampleAppApp: App {
    @StateObject private var viewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
