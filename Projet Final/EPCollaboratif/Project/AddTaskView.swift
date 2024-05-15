import SwiftUI

struct AddTaskView: View {
    // MARK: - Public Properties

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AddTaskViewModel

    // MARK: - View

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(viewModel.taskDetailsText)) {
                    TextField(viewModel.titleText, text: $viewModel.title)
                    TextField(viewModel.descriptionText, text: $viewModel.description)
                    DatePicker(viewModel.dueDateText, selection: $viewModel.dueDate, displayedComponents: .date)
                    Toggle(viewModel.completedText, isOn: $viewModel.isCompleted)
                }

                Button(viewModel.addTaskText) {
                    viewModel.addTask()
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(viewModel.isSaveDisabled)
            }
            .navigationBarTitle(viewModel.newTaskText, displayMode: .inline)
            .navigationBarItems(trailing: Button(viewModel.cancelText) {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// Preview
struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        // Assuming there is an existing project to be passed here
        AddTaskView(viewModel: .init(onSavedTask: { _ in }))
    }
}
