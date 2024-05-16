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

    let taskDetailsText = "Détails de la tâche"
    let titleText = "Titre"
    let descriptionText = "Description"
    let dueDateText = "Date d'échéance"
    let completedText = "Terminé"
    let addTaskText = "Ajouter une tâche"
    let cancelText = "Annuler"
    let newTaskText = "Nouvelle tâche"

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
