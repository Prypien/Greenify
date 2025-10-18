import SwiftUI

struct CompanyListView: View {
    private let companies = MockData.companies

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(companies) { company in
                        companyCard(for: company)
                    }
                }
                .padding()
            }
            .background(Color.lightBackground.ignoresSafeArea())
            .navigationTitle("Companies")
        }
    }

    private func companyCard(for company: Company) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center, spacing: 16) {
                Image(systemName: company.logo)
                    .font(.system(size: 42))
                    .foregroundStyle(Color.primaryGreen)
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(Color.white.opacity(0.92))
                            .shadow(color: Color.primaryGreen.opacity(0.15), radius: 12, x: 0, y: 8)
                    )
                VStack(alignment: .leading, spacing: 6) {
                    Text(company.name)
                        .font(.system(.title3, design: .rounded, weight: .semibold))
                    Text("Price per ton")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Text(String(format: "€%.1f", company.pricePerTon))
                    .font(.system(.title3, design: .rounded, weight: .bold))
                    .foregroundStyle(Color.primaryGreen)
            }

            Button(action: {}) {
                HStack {
                    Spacer()
                    Label("Sell CO₂", systemImage: "arrow.up.right")
                        .font(.system(.headline, design: .rounded))
                    Spacer()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(Color.primaryGreen.opacity(0.12))
                )
            }
            .buttonStyle(.plain)
            .foregroundStyle(Color.primaryGreen)
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(Color.cardBackground)
                .shadow(color: Color.primaryGreen.opacity(0.12), radius: 18, x: 0, y: 10)
        )
    }
}

#Preview {
    CompanyListView()
}
