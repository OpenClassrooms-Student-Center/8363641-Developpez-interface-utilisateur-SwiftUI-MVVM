@testable import EPCollaboratif
import XCTest

class HomeScreenViewModelTests: XCTestCase {
    // MARK: - Propriétés

    var viewModel: HomeScreenViewModel!
    var projects: [Project]!

    // MARK: - Configuration et Teardown

    override func setUp() {
        super.setUp()
        projects = [
            Project(id: 1, name: "Projet Alpha", description: "Description Alpha", startDate: "2021-01-01", endDate: "2021-12-31", tasks: []),
            Project(id: 2, name: "Projet Bêta", description: "Description Bêta", startDate: "2021-01-01", endDate: "2021-12-31", tasks: []),
        ]
        viewModel = HomeScreenViewModel(projects: projects)
    }

    override func tearDown() {
        viewModel = nil
        projects = nil
        super.tearDown()
    }

    // MARK: - Tests

    func testGivenInitialViewModel_WhenInitialized_ThenProjectsAreSet() {
        // Given
        let expectedCount = 2

        // When
        let actualCount = viewModel.filteredProjects.count

        // Then
        XCTAssertEqual(actualCount, expectedCount, "Devrait avoir \(expectedCount) projets initialement.")
    }

    func testGivenEmptySearchText_WhenSearching_ThenAllProjectsAreReturned() {
        // Given
        let expectedCount = 2
        viewModel.searchText = ""

        // When
        let filtered = viewModel.filteredProjects

        // Then
        XCTAssertEqual(filtered.count, expectedCount, "Tous les projets devraient être retournés lorsque le texte de recherche est vide.")
    }

    func testGivenValidSearchText_WhenSearching_ThenFilteredProjectsAreReturned() {
        // Given
        viewModel.searchText = "Alpha"

        // When
        let filtered = viewModel.filteredProjects

        // Then
        XCTAssertEqual(filtered.count, 1, "Seuls les projets contenant 'Alpha' devraient être retournés.")
        XCTAssertEqual(filtered.first?.name, "Projet Alpha", "Le nom du projet devrait être 'Projet Alpha'.")
    }

    func testGivenInvalidSearchText_WhenSearching_ThenNoProjectsAreReturned() {
        // Given
        viewModel.searchText = "Gamma"

        // When
        let filtered = viewModel.filteredProjects

        // Then
        XCTAssertTrue(filtered.isEmpty, "Aucun projet ne devrait être retourné pour un terme de recherche invalide.")
    }

    func testGivenValidIndex_WhenDeletingProject_ThenProjectIsDeleted() {
        // Given
        let deleteIndex = 0 // Index de "Projet Alpha"

        // When
        viewModel.deleteProject(at: deleteIndex)

        // Then
        XCTAssertEqual(viewModel.filteredProjects.count, 1, "Un projet devrait être supprimé.")
        XCTAssertEqual(viewModel.filteredProjects.first?.name, "Projet Bêta", "Le projet restant devrait être 'Projet Bêta'.")
    }

    func testGivenInvalidIndex_WhenDeletingProject_ThenNoProjectIsDeleted() {
        // Given
        let deleteIndex = 10 // Hors limites

        // When
        viewModel.deleteProject(at: deleteIndex)

        // Then
        XCTAssertEqual(viewModel.filteredProjects.count, 2, "Aucun projet ne devrait être supprimé lorsque l'index est hors limites.")
    }

    func testAddingUniqueProject_IncreasesProjectCount() {
        // Given
        let newProject = Project(id: 3, name: "Projet Gamma", description: "Nouveau projet", startDate: "2022-01-01", endDate: "2022-12-31", tasks: [])

        // When
        viewModel.add(newProject)

        // Then
        XCTAssertEqual(viewModel.filteredProjects.count, 3, "La liste des projets devrait contenir trois projets après l'ajout d'un projet unique.")
        XCTAssertTrue(viewModel.filteredProjects.contains(where: { $0.id == newProject.id }), "La liste des projets devrait inclure le projet nouvellement ajouté.")
    }

    func testAddingDuplicateProject_DoesNotIncreaseProjectCount() {
        // Given
        let duplicateProject = Project(id: 1, name: "Projet Alpha", description: "Description Alpha", startDate: "2021-01-01", endDate: "2021-12-31", tasks: [])

        // When
        viewModel.add(duplicateProject)

        // Then
        XCTAssertEqual(viewModel.filteredProjects.count, 2, "La liste des projets ne devrait pas augmenter si un projet en double est ajouté.")
    }

    func testAddingProjectWithSameNameButDifferentDetails_DoesNotConsiderAsDuplicate() {
        // Given
        let sameNameDifferentProject = Project(id: 3, name: "Projet Alpha", description: "Description différente", startDate: "2023-01-01", endDate: "2023-12-31", tasks: [])

        // When
        viewModel.add(sameNameDifferentProject)

        // Then
        XCTAssertEqual(viewModel.filteredProjects.count, 3, "La liste des projets devrait augmenter même si le nom est le même mais que les autres détails diffèrent.")
    }
}
