//
//  Task.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Task: Codable, Equatable, Hashable {
    @DocumentID var id: String?
    let name: String
}
