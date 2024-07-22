//
//  CustomAnnotation.swift
//  PeepOrPoop
//
//  Created by Denys on 17.07.2024.
//

import MapKit

class CustomAnnotationView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let _ = newValue as? MKPointAnnotation else {return}
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: -5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            glyphText = "G"
            markerTintColor = .blue

        }
    }
}
