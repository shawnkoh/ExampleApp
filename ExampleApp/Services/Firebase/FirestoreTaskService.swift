//
//  FirestoreTaskService.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import Foundation
import Resolver
import Combine
import Firebase
import FirebaseFirestoreSwift

final class FirestoreTaskService: TaskService {
    @LazyInjected private var authenticationService: AuthenticationService

    @Published private(set) var tasks: [Task] = []
    var tasksPublisher: Published<[Task]>.Publisher {
        $tasks
    }

    private var subscribers = Set<AnyCancellable>()
    private var listeners: [ListenerRegistration] = []

    init() {
        authenticationService.userPublisher
            .filter { $0.id != "unauthenticated" }
            .sink { [weak self] user in
                self?.setup(user: user)
            }
            .store(in: &subscribers)
    }

    func addTask(_ task: Task) -> AnyPublisher<Void, Error> {
        authenticationService.user.taskCollection
            .document()
            .setData(from: task)
            .eraseToAnyPublisher()
    }

    func removeTask(_ task: Task) -> AnyPublisher<Void, Error> {
        guard let id = task.id else {
            return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
        }
        return authenticationService.user.taskCollection
            .document(id)
            .delete()
            .eraseToAnyPublisher()
    }

    private func setup(user: User) {
        listeners.forEach { $0.remove() }
        listeners = []

        user.taskCollection
            .addSnapshotListener { snapshot, error in
                guard let snapshot = snapshot else {
                    return
                }
                self.tasks = snapshot.documents.compactMap { try? $0.data(as: Task.self) }
            }
            .store(in: &listeners)
    }
}

private extension User {
    var taskCollection: CollectionReference {
        Firestore.firestore().collection("users").document(id).collection("tasks")
    }
}
