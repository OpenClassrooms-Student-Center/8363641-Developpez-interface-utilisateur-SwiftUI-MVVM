import Combine
import SwiftUI

class Task: Identifiable, ObservableObject, Equatable {
    // MARK: - Public Properties

    let id: Int
    var title: String
    var description: String
    var dueDate: String
    @Published var isCompleted: Bool {
        willSet {
            objectWillChange.send()
        }
    }

    // MARK: - Init

    init(id: Int, title: String, description: String, dueDate: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.description = description
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }

    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
}
