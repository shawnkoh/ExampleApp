//
//  TaskService.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import Foundation
import Combine

protocol TaskService {
    var tasks: [Task] { get }
    var tasksPublisher: Published<[Task]>.Publisher { get }
    
    func addTask(_ task: Task) -> AnyPublisher<Void, Error>
    func removeTask(_ task: Task) -> AnyPublisher<Void, Error>
}
