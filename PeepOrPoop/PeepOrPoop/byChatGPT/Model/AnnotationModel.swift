//
//  AnnotationModel.swift
//  PeepOrPoop
//
//  Created by Denys on 17.07.2024.
//

import Foundation
import MapKit

struct AnnotationModel: Identifiable, Equatable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    
    static func == (lhs: AnnotationModel, rhs: AnnotationModel) -> Bool {
        lhs.coordinate.latitude == rhs.coordinate.latitude && lhs.coordinate.longitude == rhs.coordinate.longitude
    }
}

class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    init(latitude: Double, longitude: Double) {
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
    }
}
