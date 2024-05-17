//
//  WelcomeView.swift
//  SwiftWeatherApp
//
//  Created by Andres C G on 5/16/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the Swift Weather App")
                    .bold()
                    .font(.title)
                
                if colorScheme == .light {
                    Text("Light mode")
                } else {
                    Text("Dark mode")
                }
                
                Text("Please share your current location to get the weather in your area")
                    .padding()
            }
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requesLocation()
            }
            .symbolVariant(.fill)
            .labelStyle(.titleAndIcon)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))

        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
