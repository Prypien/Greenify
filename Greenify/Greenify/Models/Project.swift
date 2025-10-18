import Foundation
import MapKit

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
