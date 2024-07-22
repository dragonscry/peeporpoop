//
//  ListButton.swift
//  PeepOrPoop
//
//  Created by Denys on 17.07.2024.
//

import SwiftUI

struct ListButton: View {
    var body: some View {
        Button(action: {
            //
        }, label: {
            Image(systemName: "line.3.horizontal")
                .font(.title2)
                .foregroundStyle(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(radius: 6)
        })
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ListButton()
}
