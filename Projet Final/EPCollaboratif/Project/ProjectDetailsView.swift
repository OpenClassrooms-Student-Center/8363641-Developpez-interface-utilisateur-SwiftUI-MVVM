import SwiftUI

struct ProjectDetailsView: View {
    // MARK: - Public Properties

    @ObservedObject var project: Project

    // MARK: - Private Properties

    @State private var showingTaskForm = false
    private var completedTasks: Int {
        project.tasks.filter { $0.isCompleted }.count
    }

    private var totalTasks: Double {
        Double(project.tasks.count)
    }

    // MARK: - View

    var body: some View {
        ScrollView {
            VStack {
                Text(project.name)
                    .font(.largeTitle)
                    .padding(.top, 20)

                Text(project.description)
                    .padding()

                // Using the computed properties
                ProgressView(value: Double(completedTasks), total: totalTasks)
                    .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                    .scaleEffect(x: 1, y: 2, anchor: .center)
                    .padding()

                Text("\(Int(project.progress * 100))% Complete")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 20)

                Divider()

                Text("Tasks")
                    .font(.headline)
                    .padding(.bottom, 5)

                ForEach(project.tasks.indices, id: \.self) { index in
                    TaskRow(task: project.tasks[index], onDelete: {
                        guard project.tasks.indices.contains(index) else { return }
                        project.tasks.remove(at: index)
                    })
                        .padding(.horizontal, 15)
                        .padding(.top, 5)
                }

                Spacer()
            }
        }
        .navigationBarTitle(Text("Détails du projet"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            showingTaskForm = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $showingTaskForm) {
            AddTaskView(
                viewModel: .init(onSavedTask: { task in
                    project.tasks.append(task)
                })
            )
        }
    }
}

// Preview
struct ProjectDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetailsView(project: mockData[0])
    }
}
