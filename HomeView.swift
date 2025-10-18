import SwiftUI
import MapKit

struct HomeView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 9.0820, longitude: 8.6753),
        span: MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 60)
    )
    @State private var selectedProject: Project?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    header
                    climateProgressCard
                    mapCard
                }
                .padding()
            }
            .background(Color.lightBackground.ignoresSafeArea())
            .navigationTitle("Greenify")
        }
        .sheet(item: $selectedProject) { project in
            ProjectDetailView(project: project)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Welcome back")
                .font(.system(.title3, design: .rounded))
                .foregroundStyle(.secondary)
            Text("Decarbonize the planet, one tap at a time")
                .font(.system(.title, design: .rounded, weight: .semibold))
                .foregroundStyle(Color.primaryGreen)
                .lineSpacing(4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var climateProgressCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Global temperature")
                        .font(.system(.headline, design: .rounded))
                        .foregroundStyle(.secondary)
                    Text("+1.2°C vs. pre-industrial level")
                        .font(.system(.title2, design: .rounded, weight: .bold))
                        .foregroundStyle(Color.primaryGreen)
                }
                Spacer()
                Image(systemName: "thermometer.sun")
                    .font(.system(size: 42, weight: .semibold))
                    .foregroundStyle(Color.primaryGreen)
                    .padding(12)
                    .background(
                        Circle()
                            .fill(Color.white)
                            .shadow(color: Color.primaryGreen.opacity(0.2), radius: 12, x: 0, y: 6)
                    )
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Progress to 1.5°C target")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.secondary)

                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.white.opacity(0.6))
                            .frame(height: 14)

                        Capsule()
                            .fill(LinearGradient(colors: [.primaryGreen, .secondaryGreen], startPoint: .leading, endPoint: .trailing))
                            .frame(width: geometry.size.width * 0.8, height: 14)
                            .shadow(color: Color.primaryGreen.opacity(0.2), radius: 6, x: 0, y: 4)
                    }
                }
                .frame(height: 14)

                HStack {
                    Label("Current", systemImage: "dot.circle")
                        .font(.system(.footnote, design: .rounded))
                        .foregroundStyle(Color.primaryGreen)
                    Spacer()
                    Text("1.5°C target")
                        .font(.system(.footnote, design: .rounded))
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(Color.cardBackground)
                .shadow(color: Color.primaryGreen.opacity(0.12), radius: 20, x: 0, y: 12)
        )
    }

    private var mapCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Active eco-projects")
                        .font(.system(.headline, design: .rounded))
                        .foregroundStyle(.secondary)
                    Text("Explore global impact")
                        .font(.system(.title3, design: .rounded, weight: .semibold))
                        .foregroundStyle(.primary)
                }
                Spacer()
                Image(systemName: "globe.europe.africa.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(Color.primaryGreen)
            }

            Map(coordinateRegion: $region, annotationItems: MockData.projects) { project in
                MapAnnotation(coordinate: project.coordinate) {
                    Button {
                        selectedProject = project
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color.primaryGreen)
                                .frame(width: 36, height: 36)
                                .shadow(color: Color.primaryGreen.opacity(0.3), radius: 8, x: 0, y: 4)
                            Image(systemName: "leaf.fill")
                                .foregroundStyle(.white)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .frame(height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))

            VStack(alignment: .leading, spacing: 12) {
                ForEach(MockData.projects) { project in
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(project.name)
                                .font(.system(.headline, design: .rounded))
                                .foregroundStyle(.primary)
                            Text(project.location)
                                .font(.system(.subheadline, design: .rounded))
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Text(String(format: "€%.0f", project.co2Price))
                            .font(.system(.headline, design: .rounded))
                            .foregroundStyle(Color.primaryGreen)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Capsule().fill(Color.white).shadow(color: Color.primaryGreen.opacity(0.15), radius: 6, x: 0, y: 4))
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(Color.cardBackground)
                .shadow(color: Color.primaryGreen.opacity(0.12), radius: 20, x: 0, y: 12)
        )
    }
}

#Preview {
    HomeView()
}
