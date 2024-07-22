//
//  PeepMap.swift
//  PeepOrPoop
//
//  Created by Denys on 10.07.2024.
//

import SwiftUI
import MapKit
import CoreLocation


struct PeepMap: View {
    
    let locationManager = LocationManager()
    
    var body: some View {
        ZStack(alignment: .top) {
            PeepMapRepresentable()
                .ignoresSafeArea(.all)
            VStack {
                ListButton()
                    .padding(.leading, 20)
                Spacer()
                HStack {
                    Button(action: {
                        //
                    }, label: {
                        PeepButton()
                    })
                    Spacer()
                    Button(action: {
                        //
                    }, label: {
                        PoopButton()
                    })
                }
                .padding(.horizontal, 20)
            }
            
        }
    }
}


//extension CLLocationCoordinate2D {
//    static var userLocation: CLLocationCoordinate2D {
//        return .init(latitude: 25.7692, longitude: -80.1959)
//    }
//}
//
//extension MKCoordinateRegion {
//    static var userRegion: MKCoordinateRegion {
//        return .init(center: .userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
//    }
//}

#Preview {
    PeepMap()
}


//TODO:
//1. Make app track you (request)
//2. Create button to add Markers
//3. Create List with markers
//4. Create SwifUI Data
//5. FindWay to track your movement



