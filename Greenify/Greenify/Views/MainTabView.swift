import SwiftUI

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

#Preview {
    MainTabView()
}
