//
//  MockAuthenticationService.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import Foundation

class MockAuthenticationService: AuthenticationService {
    @Published var user: User = .init(id: "unauthenticated")
    var userPublisher: Published<User>.Publisher { $user }

    func signIn() {
        user = User(id: "mock")
    }
}
