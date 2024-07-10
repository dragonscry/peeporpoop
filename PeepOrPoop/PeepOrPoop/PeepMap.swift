//
//  PeepMap.swift
//  PeepOrPoop
//
//  Created by Denys on 10.07.2024.
//

import SwiftUI
import MapKit

struct PeepMap: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    //var Markers: Marker = []
    
    var body: some View {
        ZStack {
            Map(position: $cameraPosition) {
                //Marker("Me", coordinate: .userLocation)

//                Annotation("Dog", coordinate: .userLocation) {
//                    Image(systemName: "dog.circle.fill")
//                        .font(.system(size: 25))
//                        .foregroundStyle(.green)
//                }
                UserAnnotation {
                    Image(systemName: "dog.circle.fill")
                        .font(.system(size: 25))
                        .foregroundStyle(.green)
                }
            }
            .preferredColorScheme(.dark)
            .mapControls {
                MapCompass()
                MapUserLocationButton()
            }
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }
            VStack {
                Spacer()
                HStack {
                    Button {
                        //
                    } label: {
                        PoopButton()
                    }
                    Spacer()
                    Button {
                        //
                    } label: {
                        PeepButton()
                    }

                }
                .padding(.horizontal, 30)
            }
        }
        
    }
    
}


extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 25.7692, longitude: -80.1959)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}

#Preview {
    PeepMap()
}


//TODO:
//1. Make app track you (request)
//2. Create button to add Markers
//3. Create List with markers
//4. Create SwifUI Data
//5. FindWay to track your movement

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = CLLocationCoordinate2D.userLocation
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            //locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.delegate = self
        } else {
            print("Show an alert let know is off and go turn on")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("your location is restricted")
        case .denied:
            print("you have denied")
        case .authorizedAlways, .authorizedWhenInUse:
            region = CLLocationCoordinate2D.userLocation
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
