import SwiftUI

struct HomeScreenView: View {
    // MARK: - ViewModel

    @ObservedObject var viewModel: HomeScreenViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(viewModel.titleText)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding([.top, .leading], 15)

                    SearchBarComponentView(searchText: $viewModel.searchText)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)

                    ForEach(viewModel.filteredProjects.indices, id: \.self) { index in
                        NavigationLink(destination: ProjectDetailsView(project: viewModel.filteredProjects[index])) {
                            ProjectCardComponentView(project: viewModel.filteredProjects[index], onDelete: {
                                viewModel.deleteProject(at: index)
                            })
                        }
                        .padding(.horizontal, 15)
                        .padding(.top, 5)
                    }
                }
            }
            .navigationBarTitle(viewModel.homeText, displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                viewModel.showAddProjectView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $viewModel.showAddProjectView) {
                AddProjectView(
                    viewModel: .init(onSavedProject: { project in
                        viewModel.add(project)
                    })
                )
            }
        }
    }
}

// Preview
struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(viewModel: HomeScreenViewModel(projects: mockData))
    }
}
