import SwiftUI

@main
struct EPCManagerApp: App {
    // MARK: - View

    var body: some Scene {
        WindowGroup {
            HomeScreenView(projectStore: mockStore)
        }
    }
}
