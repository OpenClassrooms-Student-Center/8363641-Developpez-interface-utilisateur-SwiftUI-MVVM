@testable import EPCollaboratif
import XCTest

class AddTaskViewModelTests: XCTestCase {
    var viewModel: AddTaskViewModel!
    var onSaveTaskCalled: Bool!
    var savedTask: Task?

    override func setUp() {
        super.setUp()
        onSaveTaskCalled = false
        savedTask = nil
        viewModel = AddTaskViewModel(onSavedTask: { task in
            self.onSaveTaskCalled = true
            self.savedTask = task
        })
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    // Test initial state of the save button
    func testGivenInitialState_WhenInitialized_ThenSaveIsDisabled() {
        let isSaveDisabled = viewModel.isSaveDisabled
        XCTAssertTrue(isSaveDisabled, "L'enregistrement devrait être désactivé lorsque le titre et la description sont tous les deux vides.")
    }

    // Test enabling the save button by providing valid input
    func testGivenValidInput_WhenInputsAreProvided_ThenSaveIsEnabled() {
        viewModel.title = "Nouvelle Tâche"
        viewModel.description = "Description de la tâche"
        let isSaveDisabled = viewModel.isSaveDisabled
        XCTAssertFalse(isSaveDisabled, "L'enregistrement devrait être activé lorsque le titre et la description sont fournis.")
    }

    // Test the add task functionality
    func testGivenTaskDetails_WhenAddingTask_ThenTaskIsSaved() {
        viewModel.title = "Terminer les tests"
        viewModel.description = "Compléter tous les tests unitaires."
        viewModel.dueDate = Date() // Utiliser la date actuelle pour simplifier
        viewModel.isCompleted = false

        viewModel.addTask()

        XCTAssertTrue(onSaveTaskCalled, "onSavedTask devrait être appelé lors de l'ajout de la tâche.")
        XCTAssertEqual(savedTask?.title, "Terminer les tests", "Le titre de la tâche devrait correspondre.")
        XCTAssertEqual(savedTask?.description, "Compléter tous les tests unitaires.", "La description de la tâche devrait correspondre.")
        XCTAssertEqual(savedTask?.isCompleted, false, "Le statut de complétion de la tâche devrait correspondre.")
    }

    // Test the effect of empty title or description on save button
    func testGivenEmptyTitleOrDescription_WhenInputChanged_ThenSaveIsConditionallyDisabled() {
        viewModel.title = "Titre Valide"
        viewModel.description = ""

        XCTAssertTrue(viewModel.isSaveDisabled, "L'enregistrement devrait être désactivé si la description est vide.")

        viewModel.description = "Description Valide"
        XCTAssertFalse(viewModel.isSaveDisabled, "L'enregistrement devrait être activé si le titre et la description sont valides.")

        viewModel.title = ""
        XCTAssertTrue(viewModel.isSaveDisabled, "L'enregistrement devrait être désactivé si le titre est vide.")
    }
}
