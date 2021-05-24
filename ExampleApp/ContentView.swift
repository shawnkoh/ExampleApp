//
//  ContentView.swift
//  ExampleApp
//
//  Created by Shawn Koh on 25/5/21.
//

import SwiftUI
import Resolver
import Combine

final class ContentViewModel: ObservableObject {
    @LazyInjected private var taskService: TaskService

    @Published private(set) var tasks: [Task] = []

    private var subscribers = Set<AnyCancellable>()

    init() {
        taskService.tasksPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.tasks = $0 }
            .store(in: &subscribers)
    }
}

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        List {
            ForEach(viewModel.tasks, id: \.self) { task in
                Text(task.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Resolver.root = .mock
        return ContentView()
    }
}
