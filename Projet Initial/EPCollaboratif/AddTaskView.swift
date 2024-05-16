import SwiftUI

struct AddTaskView: View {
    // MARK: - Public Properties

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var project: Project

    // MARK: - Private Properties

    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dueDate = Date()
    @State private var isCompleted: Bool = false

    // MARK: - View

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Détails d'une tâche")) {
                    TextField("Titre", text: $title)
                    TextField("Description", text: $description)
                    DatePicker("Date de fin", selection: $dueDate, displayedComponents: .date)
                    Toggle("Complétée", isOn: $isCompleted)
                }

                Button("Ajouter la tâche") {
                    let newTask = Task(id: project.tasks.count + 1, title: title, description: description, dueDate: dueDate.formatted(), isCompleted: isCompleted)
                    project.tasks.append(newTask)
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(title.isEmpty || description.isEmpty)
            }
            .navigationBarTitle("Nouvelle Tâche", displayMode: .inline)
            .navigationBarItems(trailing: Button("Annuler") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(project: mockData[0])
    }
}
