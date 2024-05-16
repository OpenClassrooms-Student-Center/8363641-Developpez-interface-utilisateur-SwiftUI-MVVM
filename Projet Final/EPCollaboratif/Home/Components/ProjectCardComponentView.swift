import SwiftUI

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
