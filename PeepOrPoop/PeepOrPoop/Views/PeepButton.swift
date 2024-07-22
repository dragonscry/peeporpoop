//
//  PeepButton.swift
//  PeepOrPoop
//
//  Created by Denys on 10.07.2024.
//

import SwiftUI

struct PeepButton: View {
    var body: some View {
                ZStack {
                    Circle()
                        .fill(Color.gray.gradient)
                        .frame(width: 100)
                        .shadow(radius: 10)
                    Image("water")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
    }
}

struct PoopButton: View {
    var body: some View {
                ZStack {
                    Circle()
                        .fill(Color.gray.gradient)
                        .frame(width: 100)
                        .shadow(radius: 10)
                    Image("poop")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
    }
}

#Preview {
    PeepButton()
}
