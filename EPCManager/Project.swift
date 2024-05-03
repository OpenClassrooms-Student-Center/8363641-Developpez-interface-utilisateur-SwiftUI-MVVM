import Combine
import SwiftUI

class Project: ObservableObject {
    // MARK: - Public Properties

    let id: Int
    var name: String
    var description: String
    var startDate: String
    var endDate: String
    var progress: Double {
        let totalTasks = Double(tasks.count)
        guard totalTasks > 0 else { return 0 }
        let completedTasks = Double(tasks.filter { $0.isCompleted }.count)
        return completedTasks / totalTasks
    }

    @Published var tasks: [Task] {
        didSet {
            updateTaskSubscriptions()
        }
    }

    // MARK: - Init

    init(id: Int, name: String, description: String, startDate: String, endDate: String, tasks: [Task]) {
        self.id = id
        self.name = name
        self.description = description
        self.startDate = startDate
        self.endDate = endDate
        self.tasks = tasks
        updateTaskSubscriptions()
    }

    // MARK: - Private

    private func updateTaskSubscriptions() {
        cancellables.removeAll()
        tasks.forEach { task in
            task.$isCompleted
                .sink { [weak self] _ in
                    self?.objectWillChange.send()
                }
                .store(in: &cancellables)
        }
    }

    private var cancellables = Set<AnyCancellable>()
}
