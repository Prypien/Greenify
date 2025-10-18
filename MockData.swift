import Foundation
import MapKit
import SwiftUI

struct Project: Identifiable, Hashable {
    let id: UUID
    let name: String
    let location: String
    let certification: String
    let co2Price: Double
    let description: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct Company: Identifiable, Hashable {
    let id: UUID
    let name: String
    let logo: String
    let pricePerTon: Double
}

enum TransactionType: String, Codable, CaseIterable {
    case buy = "Buy"
    case sell = "Sell"

    var icon: String {
        switch self {
        case .buy:
            return "arrow.down.circle.fill"
        case .sell:
            return "arrow.up.circle.fill"
        }
    }

    var tint: Color {
        switch self {
        case .buy:
            return .primaryGreen
        case .sell:
            return .secondaryGreen
        }
    }
}

struct Transaction: Identifiable, Hashable {
    let id: UUID
    let type: TransactionType
    let amount: Double
    let price: Double
    let date: Date
}

struct MockData {
    static let projects: [Project] = [
        Project(
            id: UUID(),
            name: "Kenya Forest Restoration",
            location: "Kenya",
            certification: "Gold Standard",
            co2Price: 18.5,
            description: "This reforestation project in Kenya absorbs 5000t CO₂ annually.",
            latitude: -0.0236,
            longitude: 37.9062
        ),
        Project(
            id: UUID(),
            name: "Solar India Initiative",
            location: "Jaipur, India",
            certification: "Verra",
            co2Price: 22.0,
            description: "Solar arrays powering 10k homes and offsetting 3200t CO₂ per year.",
            latitude: 26.9124,
            longitude: 75.7873
        ),
        Project(
            id: UUID(),
            name: "Blue Ocean Cleanup",
            location: "Bali, Indonesia",
            certification: "OceanBound",
            co2Price: 16.0,
            description: "Community-led cleanup capturing plastics and preserving marine carbon sinks.",
            latitude: -8.3405,
            longitude: 115.0920
        )
    ]

    static let companies: [Company] = [
        Company(id: UUID(), name: "EcoCorp", logo: "leaf.circle.fill", pricePerTon: 20.0),
        Company(id: UUID(), name: "GreenFuture AG", logo: "building.columns", pricePerTon: 21.5),
        Company(id: UUID(), name: "NetZero GmbH", logo: "network", pricePerTon: 19.8)
    ]

    static let transactions: [Transaction] = [
        Transaction(id: UUID(), type: .buy, amount: 50, price: 18.0, date: Date().addingTimeInterval(-86400 * 1)),
        Transaction(id: UUID(), type: .sell, amount: 25, price: 20.0, date: Date().addingTimeInterval(-86400 * 7)),
        Transaction(id: UUID(), type: .buy, amount: 40, price: 17.5, date: Date().addingTimeInterval(-86400 * 21)),
        Transaction(id: UUID(), type: .buy, amount: 30, price: 19.2, date: Date().addingTimeInterval(-86400 * 45)),
        Transaction(id: UUID(), type: .sell, amount: 20, price: 22.0, date: Date().addingTimeInterval(-86400 * 60))
    ]

    static let walletBalanceEUR: Double = 8450
    static let walletCarbonTons: Double = 145
}

extension Color {
    static let primaryGreen = Color(red: 63 / 255, green: 164 / 255, blue: 106 / 255)
    static let lightBackground = Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255)
    static let cardBackground = Color.white.opacity(0.92)
    static let secondaryGreen = Color(red: 90 / 255, green: 187 / 255, blue: 131 / 255)
}

extension DateFormatter {
    static let walletFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
}
