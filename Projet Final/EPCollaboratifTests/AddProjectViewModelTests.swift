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
        XCTAssertTrue(isSaveDisabled, "L'enregistrement devrait être désactivé lorsque le nom et la description sont vides.")
    }

    // Test enabling the save button by providing valid input
    func testGivenValidInput_WhenInputsAreProvided_ThenSaveIsEnabled() {
        viewModel.name = "Nouveau Projet"
        viewModel.description = "Description du projet"
        let isSaveDisabled = viewModel.isSaveDisabled
        XCTAssertFalse(isSaveDisabled, "L'enregistrement devrait être activé lorsque le nom et la description sont fournis.")
    }

    // Test save project functionality
    func testGivenNewProjectDetails_WhenSaveProject_ThenProjectIsSaved() {
        viewModel.name = "Projet Test"
        viewModel.description = "Description de Test"
        viewModel.saveProject()
        XCTAssertTrue(onSaveProjectCalled, "onSavedProject devrait être appelé lors de l'enregistrement du projet.")
        XCTAssertEqual(savedProject?.name, "Projet Test", "Le nom du projet enregistré devrait correspondre au nom du view model.")
        XCTAssertEqual(savedProject?.description, "Description de Test", "La description du projet enregistré devrait correspondre à la description du view model.")
    }

    // Test the effect of empty name or description on save button
    func testGivenEmptyNameOrDescription_WhenInputChanged_ThenSaveIsConditionallyDisabled() {
        viewModel.name = "Projet Test"
        viewModel.description = ""
        XCTAssertTrue(viewModel.isSaveDisabled, "L'enregistrement devrait être désactivé si la description est vide.")

        viewModel.description = "Description de Test"
        XCTAssertFalse(viewModel.isSaveDisabled, "L'enregistrement devrait être activé si le nom et la description sont valides.")

        viewModel.name = ""
        XCTAssertTrue(viewModel.isSaveDisabled, "L'enregistrement devrait être désactivé si le nom est vide.")
    }
}
