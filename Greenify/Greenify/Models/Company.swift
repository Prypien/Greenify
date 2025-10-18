import Foundation

struct Company: Identifiable, Hashable {
    let id: UUID
    let name: String
    let logo: String
    let pricePerTon: Double
}
