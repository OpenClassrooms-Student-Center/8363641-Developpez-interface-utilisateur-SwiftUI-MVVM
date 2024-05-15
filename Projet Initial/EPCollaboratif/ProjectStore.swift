import SwiftUI

class ProjectStore: ObservableObject {
    // MARK: - Public Properties

    @Published var projects: [Project]

    // MARK: - Init

    init(projects: [Project] = []) {
        self.projects = projects
    }
}
