import Foundation

class HomeScreenViewModel: ObservableObject {
    // MARK: - Private

    @Published private var projects: [Project]

    // MARK: - Init

    init(projects: [Project]) {
        self.projects = projects
    }

    // MARK: - Outputs

    @Published var searchText: String = ""
    @Published var showAddProjectView: Bool = false

    let titleText = "Welcome to EPC Manager"
    let homeText = "Home"

    var filteredProjects: [Project] {
        if searchText.isEmpty {
            return projects
        } else {
            return projects.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    // MARK: - Inputs

    func add(_ project: Project) {
        guard !projects.contains(project) else { return }
        projects.append(project)
    }

    func deleteProject(at index: Int) {
        guard projects.indices.contains(index) else { return }
        projects.removeAll { $0.id == filteredProjects[index].id }
    }
}
