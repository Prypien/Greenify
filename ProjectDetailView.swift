import SwiftUI
import MapKit

struct ProjectDetailView: View {
    let project: Project

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                heroIllustration
                projectSummary
                descriptionCard
                investButton
            }
            .padding()
        }
        .background(Color.lightBackground.ignoresSafeArea())
        .navigationTitle(project.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var heroIllustration: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [Color.primaryGreen.opacity(0.9), Color.secondaryGreen.opacity(0.7)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 220)
                .shadow(color: Color.primaryGreen.opacity(0.25), radius: 24, x: 0, y: 16)

            VStack(spacing: 16) {
                Image(systemName: "leaf.circle.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.1), radius: 12, x: 0, y: 6)
                Text(project.location)
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(.white.opacity(0.9))
                Label(project.certification, systemImage: "checkmark.seal.fill")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Capsule().fill(Color.white.opacity(0.15)))
            }
        }
    }

    private var projectSummary: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(project.name)
                .font(.system(.title, design: .rounded, weight: .bold))
                .foregroundStyle(Color.primaryGreen)
            HStack(spacing: 16) {
                summaryBadge(title: "Location", value: project.location, icon: "mappin.circle")
                summaryBadge(title: "CO₂ Price", value: "€" + String(format: "%.2f", project.co2Price) + "/t", icon: "eurosign.circle")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(Color.cardBackground)
                .shadow(color: Color.primaryGreen.opacity(0.1), radius: 16, x: 0, y: 8)
        )
    }

    private var descriptionCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Project impact", systemImage: "leaf.fill")
                .font(.system(.headline, design: .rounded))
                .foregroundStyle(Color.primaryGreen)
            Text(project.description)
                .font(.system(.body, design: .rounded))
                .foregroundStyle(.primary)
                .lineSpacing(4)
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.cardBackground)
                .shadow(color: Color.primaryGreen.opacity(0.1), radius: 16, x: 0, y: 8)
        )
    }

    private var investButton: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Invest in this project")
                    .font(.system(.headline, design: .rounded))
                Image(systemName: "arrow.right")
                    .font(.system(.headline, design: .rounded))
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(LinearGradient(colors: [.primaryGreen, .secondaryGreen], startPoint: .leading, endPoint: .trailing))
            )
            .foregroundStyle(.white)
            .shadow(color: Color.primaryGreen.opacity(0.25), radius: 18, x: 0, y: 10)
        }
        .buttonStyle(.plain)
    }

    private func summaryBadge(title: String, value: String, icon: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(title, systemImage: icon)
                .font(.system(.subheadline, design: .rounded))
                .foregroundStyle(.secondary)
            Text(value)
                .font(.system(.headline, design: .rounded))
                .foregroundStyle(.primary)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.white.opacity(0.9))
        )
    }
}

#Preview {
    NavigationStack {
        ProjectDetailView(project: MockData.projects.first!)
    }
}
