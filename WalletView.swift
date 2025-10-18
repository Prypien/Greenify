import SwiftUI

struct WalletView: View {
    private let transactions = MockData.transactions

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    balanceCard
                    actionButtons
                    transactionList
                }
                .padding()
            }
            .background(Color.lightBackground.ignoresSafeArea())
            .navigationTitle("Wallet")
        }
    }

    private var balanceCard: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Your balance")
                        .font(.system(.headline, design: .rounded))
                        .foregroundStyle(.secondary)
                    Text(String(format: "€%.0f", MockData.walletBalanceEUR))
                        .font(.system(size: 42, weight: .bold, design: .rounded))
                        .foregroundStyle(Color.primaryGreen)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 8) {
                    Label("CO₂ owned", systemImage: "leaf.fill")
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundStyle(.secondary)
                    Text(String(format: "%.0f t", MockData.walletCarbonTons))
                        .font(.system(.title2, design: .rounded, weight: .semibold))
                        .foregroundStyle(Color.primaryGreen)
                }
            }

            HStack(spacing: 16) {
                badge(icon: "chart.line.uptrend.xyaxis", title: "ROI", value: "+8.4%")
                badge(icon: "sparkles", title: "Impact", value: "Top 5%")
            }
        }
        .padding(28)
        .background(
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(Color.cardBackground)
                .shadow(color: Color.primaryGreen.opacity(0.14), radius: 20, x: 0, y: 12)
        )
    }

    private var actionButtons: some View {
        HStack(spacing: 16) {
            walletButton(title: "Buy CO₂", systemImage: "cart.fill")
            walletButton(title: "Sell CO₂", systemImage: "creditcard")
        }
    }

    private var transactionList: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Recent activity")
                .font(.system(.title3, design: .rounded, weight: .semibold))
                .foregroundStyle(.primary)

            VStack(spacing: 12) {
                ForEach(transactions) { transaction in
                    HStack(spacing: 16) {
                        Image(systemName: transaction.type.icon)
                            .font(.system(size: 28))
                            .foregroundStyle(transaction.type.tint)
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    .fill(Color.white)
                                    .shadow(color: Color.primaryGreen.opacity(0.08), radius: 8, x: 0, y: 6)
                            )
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(transaction.type.rawValue) \(Int(transaction.amount)) t CO₂")
                                .font(.system(.headline, design: .rounded))
                            Text(DateFormatter.walletFormatter.string(from: transaction.date))
                                .font(.system(.subheadline, design: .rounded))
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Text(String(format: "€%.0f", transaction.price * transaction.amount))
                            .font(.system(.headline, design: .rounded))
                            .foregroundStyle(Color.primaryGreen)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(Color.cardBackground)
                    )
                }
            }
        }
    }

    private func badge(icon: String, title: String, value: String) -> some View {
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundStyle(Color.primaryGreen)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.secondary)
                Text(value)
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(.primary)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color.white.opacity(0.92))
        )
    }

    private func walletButton(title: String, systemImage: String) -> some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Label(title, systemImage: systemImage)
                    .font(.system(.headline, design: .rounded))
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(LinearGradient(colors: [.primaryGreen.opacity(0.9), .secondaryGreen.opacity(0.9)], startPoint: .leading, endPoint: .trailing))
            )
            .foregroundStyle(.white)
            .shadow(color: Color.primaryGreen.opacity(0.18), radius: 16, x: 0, y: 10)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    WalletView()
}
