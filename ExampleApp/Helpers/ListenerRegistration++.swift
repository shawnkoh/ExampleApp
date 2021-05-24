//
//  ListenerRegistration++.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import Foundation
import Firebase

extension ListenerRegistration {
    /// Stores this type-erasing cancellable instance in the specified collection.
    ///
    /// - Parameter collection: The collection in which to store this ``ListenerRegistration``.
    func store<C>(in collection: inout C) where C : RangeReplaceableCollection, C.Element == ListenerRegistration {
        collection.append(self)
    }
}
