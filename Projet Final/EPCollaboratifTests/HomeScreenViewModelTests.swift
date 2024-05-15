@testable import EPCollaboratif
import XCTest

class HomeScreenViewModelTests: XCTestCase {
    // MARK: - Properties

    var viewModel: HomeScreenViewModel!
    var projects: [Project]!

    // MARK: - Setup and Teardown

    override func setUp() {
        super.setUp()
        projects = [
            Project(id: 1, name: "Project Alpha", description: "Description Alpha", startDate: "2021-01-01", endDate: "2021-12-31", tasks: []),
            Project(id: 2, name: "Beta Project", description: "Description Beta", startDate: "2021-01-01", endDate: "2021-12-31", tasks: []),
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
        XCTAssertEqual(actualCount, expectedCount, "Should have \(expectedCount) projects initially.")
    }

    func testGivenEmptySearchText_WhenSearching_ThenAllProjectsAreReturned() {
        // Given
        let expectedCount = 2
        viewModel.searchText = ""

        // When
        let filtered = viewModel.filteredProjects

        // Then
        XCTAssertEqual(filtered.count, expectedCount, "All projects should be returned when search text is empty.")
    }

    func testGivenValidSearchText_WhenSearching_ThenFilteredProjectsAreReturned() {
        // Given
        viewModel.searchText = "Alpha"

        // When
        let filtered = viewModel.filteredProjects

        // Then
        XCTAssertEqual(filtered.count, 1, "Only projects containing 'Alpha' should be returned.")
        XCTAssertEqual(filtered.first?.name, "Project Alpha", "The project name should be 'Project Alpha'.")
    }

    func testGivenInvalidSearchText_WhenSearching_ThenNoProjectsAreReturned() {
        // Given
        viewModel.searchText = "Gamma"

        // When
        let filtered = viewModel.filteredProjects

        // Then
        XCTAssertTrue(filtered.isEmpty, "No projects should be returned for an invalid search term.")
    }

    func testGivenValidIndex_WhenDeletingProject_ThenProjectIsDeleted() {
        // Given
        let deleteIndex = 0 // Index of "Project Alpha"

        // When
        viewModel.deleteProject(at: deleteIndex)

        // Then
        XCTAssertEqual(viewModel.filteredProjects.count, 1, "One project should be deleted.")
        XCTAssertEqual(viewModel.filteredProjects.first?.name, "Beta Project", "Remaining project should be 'Beta Project'.")
    }

    func testGivenInvalidIndex_WhenDeletingProject_ThenNoProjectIsDeleted() {
        // Given
        let deleteIndex = 10 // Out of bounds

        // When
        viewModel.deleteProject(at: deleteIndex)

        // Then
        XCTAssertEqual(viewModel.filteredProjects.count, 2, "No project should be deleted when index is out of bounds.")
    }

    func testAddingUniqueProject_IncreasesProjectCount() {
        // Given
        let newProject = Project(id: 3, name: "Project Gamma", description: "New project", startDate: "2022-01-01", endDate: "2022-12-31", tasks: [])

        // When
        viewModel.add(newProject)

        // Then
        XCTAssertEqual(viewModel.filteredProjects.count, 3, "Project list should have three projects after adding a unique project.")
        XCTAssertTrue(viewModel.filteredProjects.contains(where: { $0.id == newProject.id }), "Project list should include the newly added project.")
    }

    func testAddingDuplicateProject_DoesNotIncreaseProjectCount() {
        // Given
        let duplicateProject = Project(id: 1, name: "Project Alpha", description: "Description Alpha", startDate: "2021-01-01", endDate: "2021-12-31", tasks: [])

        // When
        viewModel.add(duplicateProject)

        // Then
        XCTAssertEqual(viewModel.filteredProjects.count, 2, "Project list should not increase if a duplicate project is added.")
    }

    func testAddingProjectWithSameNameButDifferentDetails_DoesNotConsiderAsDuplicate() {
        // Given
        let sameNameDifferentProject = Project(id: 3, name: "Project Alpha", description: "Different description", startDate: "2023-01-01", endDate: "2023-12-31", tasks: [])

        // When
        viewModel.add(sameNameDifferentProject)

        // Then
        XCTAssertEqual(viewModel.filteredProjects.count, 3, "Project list should increase even if the name is the same but other details differ.")
    }
}
