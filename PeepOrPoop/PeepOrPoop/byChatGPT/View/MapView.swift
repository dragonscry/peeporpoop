//
//  MapView.swift
//  PeepOrPoop
//
//  Created by Denys on 17.07.2024.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @ObservedObject var viewModel: MapViewModel
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(parent: MapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard !annotation.isKind(of: MKUserLocation.self) else {
                return nil
            }
            
            var annotationView: MKAnnotationView?
            
            if let cluster = annotation as? MKClusterAnnotation {
                print("true")
                return annotationView as? CustomClusterView
            } else  {
                return annotationView as? CustomClusterView
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()

        // Register default annotation views
//        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
//        mapView.register(MKClusterAnnotation.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        
        mapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        mapView.register(CustomClusterView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        if viewModel.shouldFocusOnUserLocation, let userLocation = viewModel.userLocation {
            let region = MKCoordinateRegion(center: userLocation, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            mapView.setRegion(region, animated: true)
        }

        // Remove all previous annotations and add new ones
        mapView.removeAnnotations(mapView.annotations)
        let annotations = viewModel.annotations.map { annotationModel in
            let annotation = MKPointAnnotation()
            annotation.coordinate = annotationModel.coordinate
            return annotation
        }
        mapView.addAnnotations(annotations)
    }
}


//class CustomAnnotationView: MKAnnotationView {
//    override var annotation: MKAnnotation? {
//        didSet {
//            image = UIImage(systemName: "pencil")
//        }
//    }
//}
