import SwiftUI

struct AddProjectView: View {
    // MARK: - Public Properties

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var projectStore: ProjectStore

    // MARK: - Private Properties

    @State private var name: String = ""
    @State private var description: String = ""
    @State private var startDate = Date()
    @State private var endDate = Date()

    // MARK: - View

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Project Info")) {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                    DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                }

                Button("Save Project") {
                    let newProject = Project(id: projectStore.projects.count + 1, name: name, description: description, startDate: "", endDate: "", tasks: [])
                    projectStore.projects.append(newProject)
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(name.isEmpty || description.isEmpty)
            }
            .navigationBarTitle("Add Project", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView(projectStore: mockStore)
    }
}
