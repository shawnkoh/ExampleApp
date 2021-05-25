//
//  FirestoreAuthenticationService.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import Combine

class FirestoreAuthenticationService: AuthenticationService {
    @Published var user = User(id: "unauthenticated")
    var userPublisher: Published<User>.Publisher {
        $user
    }
    
    func signIn() {
        let auth = Auth.auth()
        if let user = auth.currentUser {
            self.user = User(id: user.uid)
        } else {
            auth.signInAnonymously { result, error in
                guard let result = result else {
                    return
                }
                self.user = User(id: result.user.uid)
            }
        }
    }
}
