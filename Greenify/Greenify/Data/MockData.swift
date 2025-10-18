import Foundation

enum MockData {
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
