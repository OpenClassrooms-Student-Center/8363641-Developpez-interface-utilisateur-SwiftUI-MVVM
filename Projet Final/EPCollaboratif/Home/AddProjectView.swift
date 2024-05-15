import SwiftUI

struct AddProjectView: View {
    // MARK: - Public Properties

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AddProjectViewModel

    // MARK: - View

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(viewModel.projectInfoText)) {
                    TextField(viewModel.nameText, text: $viewModel.name)
                    TextField(viewModel.descriptionText, text: $viewModel.description)
                    DatePicker(viewModel.startDateText, selection: $viewModel.startDate, displayedComponents: .date)
                    DatePicker(viewModel.endDateText, selection: $viewModel.endDate, displayedComponents: .date)
                }

                Button(viewModel.saveProjectText) {
                    viewModel.saveProject()
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(viewModel.isSaveDisabled)
            }
            .navigationBarTitle(viewModel.addProjectText, displayMode: .inline)
            .navigationBarItems(trailing: Button(viewModel.cancelText) {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// Preview
struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView(viewModel: AddProjectViewModel(onSavedProject: { _ in }))
    }
}
