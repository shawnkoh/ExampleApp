//
//  DocumentReference++.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import Foundation
import Combine
import Firebase

extension DocumentReference {
    func setData<T: Encodable>(from data: T) -> Future<Void, Error> {
        Future { promise in
            do {
                try self.setData(from: data) { error in
                    if let error = error {
                        promise(.failure(error))
                    } else {
                        promise(.success(()))
                    }
                }
            } catch {
                promise(.failure(error))
            }
        }
    }

    func delete() -> Future<Void, Error> {
        Future { promise in
            self.delete() { error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(()))
                }
            }
        }
    }
}

