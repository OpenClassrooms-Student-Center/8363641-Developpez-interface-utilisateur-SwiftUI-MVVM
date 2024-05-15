import Foundation

class AddTaskViewModel: ObservableObject {
    // MARK: - Init

    private var onSavedTask: ((Task) -> Void)?

    init(onSavedTask: ((Task) -> Void)?) {
        self.onSavedTask = onSavedTask
    }

    // MARK: - Outputs

    @Published var title: String = ""
    @Published var description: String = ""
    @Published var dueDate = Date()
    @Published var isCompleted: Bool = false

    let taskDetailsText = "Task Details"
    let titleText = "Title"
    let descriptionText = "Description"
    let dueDateText = "Due Date"
    let completedText = "Completed"
    let addTaskText = "Add Task"
    let cancelText = "Cancel"
    let newTaskText = "New Task"

    var isSaveDisabled: Bool {
        title.isEmpty || description.isEmpty
    }

    // MARK: - Inputs

    func addTask() {
        let newTask = Task(
            id: UUID().hashValue,
            title: title,
            description: description,
            dueDate: ISO8601DateFormatter().string(from: dueDate),
            isCompleted: isCompleted
        )
        onSavedTask?(newTask)
    }
}
