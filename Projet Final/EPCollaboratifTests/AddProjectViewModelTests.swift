@testable import EPCollaboratif
import XCTest

class AddProjectViewModelTests: XCTestCase {
    var viewModel: AddProjectViewModel!
    var onSaveProjectCalled: Bool!
    var savedProject: Project?

    override func setUp() {
        super.setUp()
        onSaveProjectCalled = false
        savedProject = nil
        viewModel = AddProjectViewModel { project in
            self.onSaveProjectCalled = true
            self.savedProject = project
        }
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // Test to check the initial state of isSaveDisabled
    func testGivenInitialState_WhenInitialized_ThenSaveIsDisabled() {
        let isSaveDisabled = viewModel.isSaveDisabled
        XCTAssertTrue(isSaveDisabled, "Save should be disabled when both name and description are empty.")
    }

    // Test enabling the save button by providing valid input
    func testGivenValidInput_WhenInputsAreProvided_ThenSaveIsEnabled() {
        viewModel.name = "New Project"
        viewModel.description = "Project Description"
        let isSaveDisabled = viewModel.isSaveDisabled
        XCTAssertFalse(isSaveDisabled, "Save should be enabled when both name and description are provided.")
    }

    // Test save project functionality
    func testGivenNewProjectDetails_WhenSaveProject_ThenProjectIsSaved() {
        viewModel.name = "Test Project"
        viewModel.description = "Test Description"
        viewModel.saveProject()
        XCTAssertTrue(onSaveProjectCalled, "onSavedProject should be called when saving the project.")
        XCTAssertEqual(savedProject?.name, "Test Project", "The saved project name should match the view model name.")
        XCTAssertEqual(savedProject?.description, "Test Description", "The saved project description should match the view model description.")
    }

    // Test the effect of empty name or description on save button
    func testGivenEmptyNameOrDescription_WhenInputChanged_ThenSaveIsConditionallyDisabled() {
        viewModel.name = "Test Project"
        viewModel.description = ""
        XCTAssertTrue(viewModel.isSaveDisabled, "Save should be disabled if the description is empty.")

        viewModel.description = "Test Description"
        XCTAssertFalse(viewModel.isSaveDisabled, "Save should be enabled if both name and description are valid.")

        viewModel.name = ""
        XCTAssertTrue(viewModel.isSaveDisabled, "Save should be disabled if the name is empty.")
    }
}
