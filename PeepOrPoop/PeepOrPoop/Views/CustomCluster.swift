//
//  CustomCluster.swift
//  PeepOrPoop
//
//  Created by Denys on 17.07.2024.
//

import MapKit

class CustomClusterView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let cluster = newValue as? MKClusterAnnotation else {return}
            canShowCallout = true
            markerTintColor = .purple
            glyphText = "\(cluster.memberAnnotations.count)"
        }
    }
}
