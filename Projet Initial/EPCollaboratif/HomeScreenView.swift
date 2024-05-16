import SwiftUI

struct HomeScreenView: View {
    // MARK: - Public Properties

    @ObservedObject var projectStore: ProjectStore

    // MARK: - Private Properties

    @State private var searchText = ""
    @State private var showAddProjectView = false
    private var filteredProjects: [Project] {
        if searchText.isEmpty {
            return projectStore.projects
        } else {
            return projectStore.projects.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    // MARK: - View

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("EPCollaboratif")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding([.top, .leading], 15)

                    SearchBarComponentView(searchText: $searchText)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)

                    ForEach(filteredProjects.indices, id: \.self) { index in
                        NavigationLink(destination: ProjectDetailsView(project: filteredProjects[index])) {
                            ProjectCardComponentView(project: filteredProjects[index], onDelete: {
                                deleteProject(at: index)
                            })
                        }
                        .padding(.horizontal, 15)
                        .padding(.top, 5)
                    }
                }
            }
            .navigationBarTitle("Accueil", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                showAddProjectView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showAddProjectView) {
                AddProjectView(projectStore: projectStore)
            }
        }
    }

    func deleteProject(at index: Int) {
        projectStore.projects.removeAll { $0.id == filteredProjects[index].id }
    }
}

struct ProjectCardComponentView: View {
    // MARK: - Public Properties

    @ObservedObject var project: Project
    var onDelete: () -> Void // Closure to handle deletion

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(project.name)
                        .font(.headline)
                    Text(project.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    ProgressView(value: project.progress, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                    Text("\(Int(project.progress * 100))% Complété")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Button(action: onDelete) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
                .padding(.all, 8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct SearchBarComponentView: View {
    // MARK: - Public Properties

    @Binding var searchText: String

    // MARK: - View

    var body: some View {
        HStack {
            TextField("Rechercher un projet...", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        if !searchText.isEmpty {
                            Button(action: {
                                self.searchText = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
        }
        .padding(.horizontal, 10)
    }
}

// Preview
struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(projectStore: .init(projects: mockData))
    }
}
