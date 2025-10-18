import SwiftUI

struct ProfileView: View {
    private let userName = "Jen Preißer"
    private let email = "jen.preisser@greenify.earth"

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    profileCard
                    actionButtons
                }
                .padding()
            }
            .background(Color.lightBackground.ignoresSafeArea())
            .navigationTitle("Profile")
        }
    }

    private var profileCard: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(LinearGradient(colors: [.primaryGreen, .secondaryGreen.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 120, height: 120)
                    .shadow(color: Color.primaryGreen.opacity(0.25), radius: 18, x: 0, y: 12)
                Image(systemName: "person.fill")
                    .font(.system(size: 54))
                    .foregroundStyle(.white)
            }

            VStack(spacing: 8) {
                Text(userName)
                    .font(.system(.title2, design: .rounded, weight: .semibold))
                    .foregroundStyle(Color.primaryGreen)
                Text(email)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.secondary)
                Label("KYC verified", systemImage: "checkmark.seal.fill")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(Color.primaryGreen)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Capsule().fill(Color.white.opacity(0.9)))
            }
        }
        .padding(32)
        .background(
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(Color.cardBackground)
                .shadow(color: Color.primaryGreen.opacity(0.14), radius: 22, x: 0, y: 12)
        )
    }

    private var actionButtons: some View {
        VStack(spacing: 16) {
            profileButton(title: "Edit Profile", systemImage: "pencil")
            profileButton(title: "Log Out", systemImage: "rectangle.portrait.and.arrow.right")
        }
    }

    private func profileButton(title: String, systemImage: String) -> some View {
        Button(action: {}) {
            HStack {
                Label(title, systemImage: systemImage)
                    .font(.system(.headline, design: .rounded))
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(.headline, design: .rounded))
            }
            .padding()
            .foregroundStyle(Color.primaryGreen)
            .background(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(Color.white)
                    .shadow(color: Color.primaryGreen.opacity(0.1), radius: 10, x: 0, y: 6)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ProfileView()
}
