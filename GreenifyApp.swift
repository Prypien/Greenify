import SwiftUI
import MapKit

@main
struct GreenifyApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "globe")
                }

            ProjectsView()
                .tabItem {
                    Label("Projects", systemImage: "leaf")
                }

            CompanyListView()
                .tabItem {
                    Label("Companies", systemImage: "building.2")
                }

            WalletView()
                .tabItem {
                    Label("Wallet", systemImage: "wallet.pass")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .tint(.primaryGreen)
    }
}

struct ProjectsView: View {
    private let projects = MockData.projects

    var body: some View {
        NavigationStack {
            List {
                ForEach(projects) { project in
                    NavigationLink(value: project) {
                        projectRow(for: project)
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color.lightBackground)
            .navigationTitle("Projects")
            .navigationDestination(for: Project.self) { project in
                ProjectDetailView(project: project)
            }
        }
    }

    private func projectRow(for project: Project) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(LinearGradient(colors: [.primaryGreen.opacity(0.15), .secondaryGreen.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 60, height: 60)
                    Image(systemName: "leaf.circle")
                        .font(.system(size: 32))
                        .foregroundStyle(Color.primaryGreen)
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(project.name)
                        .font(.system(.headline, design: .rounded))
                    Text(project.location)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Text(String(format: "€%.0f", project.co2Price))
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(Color.primaryGreen)
            }
            Label(project.certification, systemImage: "checkmark.seal")
                .font(.system(.footnote, design: .rounded))
                .foregroundStyle(Color.primaryGreen)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    MainTabView()
}
