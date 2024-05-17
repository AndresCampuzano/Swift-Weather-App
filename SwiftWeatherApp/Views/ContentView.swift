//
//  ContentView.swift
//  SwiftWeatherApp
//
//  Created by Andres C G on 5/16/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var locationManager = LocationManager()
    @State var weatherManager: WeatherManager?
    @State var weather: ResponseBody?
    @State var errorMessage: String?
    
    init() {
        do {
            _weatherManager = State(initialValue: try WeatherManager())
        } catch {
            _weatherManager = State(initialValue: nil)
            _errorMessage = State(initialValue: "Error initializing WeatherManager: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        VStack {
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
            } else if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager?.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(colorScheme == .light
                    ? Color(hue: 0.664, saturation: 0.811, brightness: 0.46)
                    : Color(hue: 0.664, saturation: 0.811, brightness: 0.26)
        )
    }
}

#Preview {
    ContentView()
}
