import Foundation
import SwiftUI

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
