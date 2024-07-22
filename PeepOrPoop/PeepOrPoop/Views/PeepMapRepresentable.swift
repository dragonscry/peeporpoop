//
//  PeepMapRepresentable.swift
//  PeepOrPoop
//
//  Created by Denys on 17.07.2024.
//

import SwiftUI
import MapKit

struct PeepMapRepresentable: UIViewRepresentable {
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension PeepMapRepresentable {
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: PeepMapRepresentable
        
        init(parent: PeepMapRepresentable) {
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            print("\(userLocation.coordinate)")
            parent.mapView.setRegion(region, animated: true)
        }
    }
}
