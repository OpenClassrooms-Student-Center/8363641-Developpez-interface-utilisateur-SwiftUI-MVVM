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
        XCTAssertTrue(isSaveDisabled, "Save should be disabled when title and description are both empty.")
    }

    // Test enabling the save button by providing valid input
    func testGivenValidInput_WhenInputsAreProvided_ThenSaveIsEnabled() {
        viewModel.title = "New Task"
        viewModel.description = "Task Description"
        let isSaveDisabled = viewModel.isSaveDisabled
        XCTAssertFalse(isSaveDisabled, "Save should be enabled when both title and description are provided.")
    }

    // Test the add task functionality
    func testGivenTaskDetails_WhenAddingTask_ThenTaskIsSaved() {
        viewModel.title = "Finish Testing"
        viewModel.description = "Complete all unit tests."
        viewModel.dueDate = Date() // Use current date for simplicity
        viewModel.isCompleted = false

        viewModel.addTask()

        XCTAssertTrue(onSaveTaskCalled, "onSavedTask should be called when adding the task.")
        XCTAssertEqual(savedTask?.title, "Finish Testing", "The task title should match.")
        XCTAssertEqual(savedTask?.description, "Complete all unit tests.", "The task description should match.")
        XCTAssertEqual(savedTask?.isCompleted, false, "The task completion status should match.")
    }

    // Test the effect of empty title or description on save button
    func testGivenEmptyTitleOrDescription_WhenInputChanged_ThenSaveIsConditionallyDisabled() {
        viewModel.title = "Valid Title"
        viewModel.description = ""

        XCTAssertTrue(viewModel.isSaveDisabled, "Save should be disabled if the description is empty.")

        viewModel.description = "Valid Description"
        XCTAssertFalse(viewModel.isSaveDisabled, "Save should be enabled if both title and description are valid.")

        viewModel.title = ""
        XCTAssertTrue(viewModel.isSaveDisabled, "Save should be disabled if the title is empty.")
    }
}
