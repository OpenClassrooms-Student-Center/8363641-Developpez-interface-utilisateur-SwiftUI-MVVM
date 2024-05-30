import SwiftUI

@main
struct EPCollaboratifApp: App {
    // MARK: - View

    var body: some Scene {
        WindowGroup {
            HomeScreenView(projectStore: mockStore)
                .environment(\.locale, Locale(identifier: "fr"))
        }
    }
}
