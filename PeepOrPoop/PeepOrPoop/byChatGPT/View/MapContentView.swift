//
//  MapContentView.swift
//  PeepOrPoop
//
//  Created by Denys on 17.07.2024.
//

import SwiftUI
import MapKit

struct MapContentView: View {
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
        VStack {
            MapView(viewModel: viewModel)
                .edgesIgnoringSafeArea(.all)
            
            HStack {
                Button(action: {
                    viewModel.startUpdatingLocation()
                }) {
                    Text("Start Updating Location")
                }
                Button(action: {
                    viewModel.stopUpdatingLocation()
                }) {
                    Text("Stop Updating Location")
                }
                Button(action: {
                    viewModel.addAnnotation()
                }) {
                    Text("Add Annotation")
                }
                Button(action: {
                    viewModel.focusOnUserLocation()
                }) {
                    Text("Return to User Location")
                }
            }
            .padding()
        }
    }
}

