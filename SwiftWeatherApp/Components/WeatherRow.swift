//
//  WeatherRow.swift
//  SwiftWeatherApp
//
//  Created by Andres C G on 5/16/24.
//

import SwiftUI

struct WeatherRow: View {
    @Environment(\.colorScheme) var colorScheme

    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .foregroundStyle(colorScheme == .light ? .black : .white)
                .background(colorScheme == .light
                            ? Color(hue: 1.0, saturation: 0.0, brightness: 0.888)
                            : Color(hue: 1.0, saturation: 0.0, brightness: 0.229)
                        )
                .clipShape(RoundedRectangle(cornerRadius: 30))

            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

#Preview {
    WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
}
