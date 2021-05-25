//
//  RealFirebaseService.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import Foundation
import Firebase

class RealFirebaseService: FirebaseService {
    func configure() {
        FirebaseApp.configure()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
    }
}
