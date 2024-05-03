import Combine
import SwiftUI

class Task: Identifiable, ObservableObject {
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
}
