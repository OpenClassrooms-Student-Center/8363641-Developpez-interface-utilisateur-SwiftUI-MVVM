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
                Section(header: Text("Infos du projet")) {
                    TextField("Nom", text: $name)
                    TextField("Description", text: $description)
                    DatePicker("Date de démarrage", selection: $startDate, displayedComponents: .date)
                    DatePicker("Date de fin", selection: $endDate, displayedComponents: .date)
                }

                Button("Créer le projet") {
                    let newProject = Project(id: projectStore.projects.count + 1, name: name, description: description, startDate: "", endDate: "", tasks: [])
                    projectStore.projects.append(newProject)
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(name.isEmpty || description.isEmpty)
            }
            .navigationBarTitle("Nouveau Projet", displayMode: .inline)
            .navigationBarItems(trailing: Button("Annuler") {
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
