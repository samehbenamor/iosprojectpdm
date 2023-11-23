import SwiftUI
import MapKit
import CoreLocation

struct UserLocation: Identifiable, Equatable {
    static func == (lhs: UserLocation, rhs: UserLocation) -> Bool {
        return lhs.id == rhs.id
    }

    let id = UUID()
    let annotation: MKPointAnnotation
}

struct Polyline: View {
    var points: [CLLocationCoordinate2D]
    var strokeColor: Color
    var lineWidth: CGFloat

    var body: some View {
        Path { path in
            if let firstPoint = points.first {
                path.move(to: CGPoint(x: firstPoint.latitude, y: firstPoint.longitude))

                for point in points.dropFirst() {
                    path.addLine(to: CGPoint(x: point.latitude, y: point.longitude))
                }
            }
        }
        .stroke(strokeColor, lineWidth: lineWidth)
    }
}

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )

    @State private var userLocation: UserLocation?
    @State private var productLocation: UserLocation?
    @State private var route: MKPolyline?
    @State private var routePoints: [CLLocationCoordinate2D] = [] // New array to store route points
    @State private var locationManager = CLLocationManager()

    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: [userLocation, productLocation].compactMap { $0 }) { location in
            MapMarker(coordinate: location.annotation.coordinate, tint: location == userLocation ? .blue : .red)
        }
        .overlay(
            Polyline(points: routePoints, strokeColor: .yellow, lineWidth: 2) // Use the Polyline view
        )
        .onAppear {
            locationManager.delegate = MapViewDelegate(userLocation: $userLocation, productLocation: $productLocation, routePoints: $routePoints)
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
        .frame(width: 400, height: 400)
        
    }
}

class MapViewDelegate: NSObject, CLLocationManagerDelegate {
    @Binding var userLocation: UserLocation?
    @Binding var productLocation: UserLocation?
    @Binding var routePoints: [CLLocationCoordinate2D]

    init(userLocation: Binding<UserLocation?>, productLocation: Binding<UserLocation?>, routePoints: Binding<[CLLocationCoordinate2D]>) {
        _userLocation = userLocation
        _productLocation = productLocation
        _routePoints = routePoints
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let userCoordinates = location.coordinate
            let userAnnotation = MKPointAnnotation()
            userAnnotation.coordinate = userCoordinates
            userLocation = UserLocation(annotation: userAnnotation)

            let productLatitude: CLLocationDegrees = 37.7652
            let productLongitude: CLLocationDegrees = -122.4359
            let productCoordinates = CLLocationCoordinate2D(latitude: productLatitude, longitude: productLongitude)
            let productAnnotation = MKPointAnnotation()
            productAnnotation.coordinate = productCoordinates
            productLocation = UserLocation(annotation: productAnnotation)

            // Update route points
            routePoints = [userCoordinates, productCoordinates]
        }
    }
}
