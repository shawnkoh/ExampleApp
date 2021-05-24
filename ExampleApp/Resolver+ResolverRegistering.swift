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

        #if DEBUG
        mock.register { MockFirebaseService() as FirebaseService }
            .scope(.cached)
        #endif
    }
}
