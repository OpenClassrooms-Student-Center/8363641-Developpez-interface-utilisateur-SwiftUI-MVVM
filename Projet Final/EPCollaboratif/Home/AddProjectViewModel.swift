import Foundation

class AddProjectViewModel: ObservableObject {
    // MARK: - Init

    private var onSavedProject: ((Project) -> Void)?

    init(onSavedProject: ((Project) -> Void)?) {
        self.onSavedProject = onSavedProject
    }

    // MARK: - Outputs

    @Published var name: String = ""
    @Published var description: String = ""
    @Published var startDate = Date()
    @Published var endDate = Date()

    let projectInfoText = "Informations sur le projet"
    let nameText = "Nom"
    let descriptionText = "Description"
    let startDateText = "Date de début"
    let endDateText = "Date de fin"
    let saveProjectText = "Enregistrer le projet"
    let addProjectText = "Ajouter un projet"
    let cancelText = "Annuler"

    var isSaveDisabled: Bool {
        name.isEmpty || description.isEmpty
    }

    // MARK: - Inputs

    func saveProject() {
        let newProject = Project(
            id: UUID().hashValue,
            name: name,
            description: description,
            startDate: ISO8601DateFormatter().string(from: startDate),
            endDate: ISO8601DateFormatter().string(from: endDate),
            tasks: []
        )
        onSavedProject?(newProject)
    }
}
