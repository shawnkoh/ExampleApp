//
//  Resolver+ResolverRegistering.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    #if DEBUG
    static let mock = Resolver(parent: main)
    #endif

    public static func registerAllServices() {
        register { RealFirebaseService() as FirebaseService }
            .scope(.cached)

        register { FirestoreAuthenticationService() as AuthenticationService }
            .scope(.cached)

        register { FirestoreTaskService() as TaskService}
            .scope(.cached)

        #if DEBUG
        mock.register { MockFirebaseService() as FirebaseService }
            .scope(.cached)

        mock.register { MockAuthenticationService() as AuthenticationService }
            .scope(.cached)

        mock.register { MockTaskService() as TaskService }
            .scope(.cached)
        #endif
    }
}
