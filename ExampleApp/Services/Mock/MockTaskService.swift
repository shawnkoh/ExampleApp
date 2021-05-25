//
//  MockTaskService.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import Resolver
import Combine

class MockTaskService: TaskService {
    @LazyInjected var authenticationService: AuthenticationService

    @Published var tasks: [Task] = []
    var tasksPublisher: Published<[Task]>.Publisher { $tasks }

    init() {
        tasks = (1...10).map { index in
            let formatter = NumberFormatter()
            formatter.numberStyle = .spellOut
            return Task(id: formatter.string(from: .init(value: index)), name: "Task \(index)")
        }
    }

    func addTask(_ task: Task) -> AnyPublisher<Void, Error> {
        tasks.append(task)
        return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
    }

    func removeTask(_ task: Task) -> AnyPublisher<Void, Error> {
        if let index = tasks.firstIndex(where: { $0 == task }) {
            tasks.remove(at: index)
        }
        return Just(()).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
