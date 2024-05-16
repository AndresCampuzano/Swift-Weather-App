//
//  WeatherView.swift
//  SwiftWeatherApp
//
//  Created by Andres C G on 5/16/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day()))")
                        .fontWeight(.light)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            VStack {
                                let weatherIcon = weather.weather[0].icon
                                                                
                                
                                // Day icons
                                if weatherIcon == "01d" {
                                    Image(systemName: "sun.max")
                                       
                                }
                                else if (weatherIcon == "02d") {
                                    Image(systemName: "cloud.sun")
                                }
                                else if (weatherIcon == "03d") {
                                    Image(systemName: "cloud")
                                }
                                else if (weatherIcon == "04d") {
                                    Image(systemName: "cloud")
                                }
                                else if (weatherIcon == "09d") {
                                    Image(systemName: "cloud.rain")
                                }
                                else if (weatherIcon == "10d") {
                                    Image(systemName: "cloud.sun.rain")
                                }
                                else if (weatherIcon == "11d") {
                                    Image(systemName: "cloud.bolt")
                                }
                                else if (weatherIcon == "13d") {
                                    Image(systemName: "snowflake")
                                }
                                else if (weatherIcon == "50d") {
                                    Image(systemName: "cloud.fog")
                                }
                                
                                // Night icons
                                else if weatherIcon == "01n" {
                                    Image(systemName: "moon.stars")
                                       
                                }
                                else if (weatherIcon == "02n") {
                                    Image(systemName: "cloud.moon")
                                }
                                else if (weatherIcon == "03n") {
                                    Image(systemName: "cloud")
                                }
                                else if (weatherIcon == "04n") {
                                    Image(systemName: "cloud")
                                }
                                else if (weatherIcon == "09n") {
                                    Image(systemName: "cloud.moon.rain")
                                }
                                else if (weatherIcon == "10n") {
                                    Image(systemName: "cloud.moon.rain")
                                }
                                else if (weatherIcon == "11n") {
                                    Image(systemName: "cloud.moon.bolt")
                                }
                                else if (weatherIcon == "13n") {
                                    Image(systemName: "snowflake")
                                }
                                else if (weatherIcon == "50n") {
                                    Image(systemName: "cloud.fog")
                                }
                            }
                            .font(.system(size: 40))
                           
                           
                            
                            Text(weather.weather[0].main)
                            
                            
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 94))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .ignoresSafeArea(.keyboard)
        .background(Color(hue: 0.664, saturation: 0.811, brightness: 0.46))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
