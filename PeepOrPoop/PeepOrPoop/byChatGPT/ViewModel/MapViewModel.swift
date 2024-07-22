//
//  MapViewModel.swift
//  PeepOrPoop
//
//  Created by Denys on 17.07.2024.
//

import Foundation
import MapKit
import Combine

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var annotations: [AnnotationModel] = []
    @Published var userLocation: CLLocationCoordinate2D?
    @Published var shouldFocusOnUserLocation = false
    @Published var isUpdatingLocation = false

    private var locationManager = CLLocationManager()
    private var cancellables = Set<AnyCancellable>()

    override init() {
        super.init()
        setupLocationManager()
    }

    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
        isUpdatingLocation = true
    }

    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
        isUpdatingLocation = false
    }

    func addAnnotation() {
        if let userLocation = userLocation {
            let annotation = AnnotationModel(coordinate: userLocation)
            annotations.append(annotation)
        }
        print(annotations.count)
    }

    func focusOnUserLocation() {
        shouldFocusOnUserLocation = true
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            userLocation = location.coordinate
            if shouldFocusOnUserLocation {
                shouldFocusOnUserLocation = false
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }
}
