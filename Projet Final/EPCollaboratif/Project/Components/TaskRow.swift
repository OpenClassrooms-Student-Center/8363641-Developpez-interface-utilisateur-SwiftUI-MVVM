import SwiftUI

struct TaskRow: View {
    // MARK: - Public Properties

    @ObservedObject var task: Task
    var onDelete: () -> Void

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(task.title)
                            .font(.headline)
                            .foregroundColor(.primary)
                        Spacer()
                        Toggle("", isOn: $task.isCompleted)
                            .labelsHidden() // Hide the label for the toggle
                    }
                    Text(task.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("Due: \(task.dueDate)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            HStack {
                Spacer()
                Button(action: onDelete) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
                .padding(.all, 8)
            }
        }
        .padding(.all, 8)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
