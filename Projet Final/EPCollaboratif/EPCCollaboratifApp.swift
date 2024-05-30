import SwiftUI

@main
struct EPCCollaboratifApp: App {
    // MARK: - View

    var body: some Scene {
        WindowGroup {
            HomeScreenView(
                viewModel: HomeScreenViewModel(
                    projects: mockData
                )
            )
            .environment(\.locale, Locale(identifier: "fr"))
        }
    }
}
